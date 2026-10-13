#include <jni.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

static void onMain(void (^action)(void)) {
    if ([NSThread isMainThread]) action();
    else dispatch_sync(dispatch_get_main_queue(), action);
}

// JNI modified UTF-8 is not UTF-8. Use UTF-16 to preserve emoji and embedded Unicode.
static NSString* javaString(JNIEnv* env, jstring value) {
    if (!value) return @"";
    const jchar* chars = env->GetStringChars(value, nullptr);
    if (!chars) return @"";
    NSString* result = [[NSString alloc] initWithCharacters:reinterpret_cast<const unichar*>(chars)
                                                  length:env->GetStringLength(value)];
    env->ReleaseStringChars(value, chars);
    return result;
}

@interface NGEWebView : NSObject <WKScriptMessageHandler, WKNavigationDelegate, WKURLSchemeHandler>
@property(nonatomic,strong) WKWebView* view;
@property(nonatomic,strong) NSString* html;
@property(nonatomic,strong) NSMutableArray<NSString*>* messages;
@property(nonatomic,strong) NSMutableDictionary<NSNumber*,id<WKURLSchemeTask>>* requests;
@property(nonatomic) long long sequence;
@end

@implementation NGEWebView
- (void)enqueue:(NSDictionary*)payload {
    if (self.messages.count >= 512) return;
    NSData* data = [NSJSONSerialization dataWithJSONObject:payload options:0 error:nil];
    if (data) [self.messages addObject:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
}
- (void)userContentController:(WKUserContentController*)controller didReceiveScriptMessage:(WKScriptMessage*)message {
    if (!message.frameInfo.isMainFrame || ![self.view.URL.scheme isEqualToString:@"tide-app"]
        || ![message.body isKindOfClass:NSString.class] || [(NSString*)message.body length] > 256000) return;
    if (self.messages.count < 512) [self.messages addObject:message.body];
}
- (void)webView:(WKWebView*)view decidePolicyForNavigationAction:(WKNavigationAction*)action
 decisionHandler:(void (^)(WKNavigationActionPolicy))decision {
    NSURL* url = action.request.URL;
    BOOL allowed = action.targetFrame.isMainFrame && [url.scheme isEqualToString:@"tide-app"]
        && [url.host isEqualToString:@"local"];
    decision(allowed ? WKNavigationActionPolicyAllow : WKNavigationActionPolicyCancel);
}
- (void)webView:(WKWebView*)view didFinishNavigation:(WKNavigation*)navigation {
    [self enqueue:@{@"type":@"ready"}];
}
- (void)webView:(WKWebView*)view didFailProvisionalNavigation:(WKNavigation*)navigation withError:(NSError*)error {
    [self enqueue:@{@"type":@"error",@"message":@"WKWebView failed to load the local application"}];
}
- (void)webViewWebContentProcessDidTerminate:(WKWebView*)view {
    [self enqueue:@{@"type":@"error",@"message":@"WKWebView content process terminated"}];
}
- (void)webView:(WKWebView*)view startURLSchemeTask:(id<WKURLSchemeTask>)task {
    NSURL* url = task.request.URL;
    if ([url.scheme isEqualToString:@"tide-app"] && [url.host isEqualToString:@"local"] && [url.path isEqualToString:@"/"]) {
        NSData* body = [self.html dataUsingEncoding:NSUTF8StringEncoding];
        [task didReceiveResponse:[[NSURLResponse alloc] initWithURL:url MIMEType:@"text/html" expectedContentLength:body.length textEncodingName:@"utf-8"]];
        [task didReceiveData:body]; [task didFinish]; return;
    }
    if (![url.scheme isEqualToString:@"tide-resource"] || self.requests.count >= 64) {
        [task didFailWithError:[NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorResourceUnavailable userInfo:nil]]; return;
    }
    NSNumber* request = @(++self.sequence);
    self.requests[request] = task;
    [self enqueue:@{@"type":@"resource",@"request":request,@"url":url.absoluteString,@"method":task.request.HTTPMethod ?: @"GET"}];
}
- (void)webView:(WKWebView*)view stopURLSchemeTask:(id<WKURLSchemeTask>)task {
    for (NSNumber* request in self.requests.allKeys) if (self.requests[request] == task) {
        [self.requests removeObjectForKey:request];
        [self enqueue:@{@"type":@"resource-cancel",@"request":request}]; break;
    }
}
@end

static NSMutableDictionary<NSNumber*,NGEWebView*>* views;
static long long nextView = 0;

extern "C" JNIEXPORT jlong JNICALL Java_org_ngengine_libjglios_webview_NativeIosWebView_create(JNIEnv*, jobject, jlong parentPointer) {
    __block jlong result = 0;
    onMain(^{
        UIView* parent = (__bridge UIView*)reinterpret_cast<void*>(parentPointer);
        if (!parent) {
            for (UIWindow* window in UIApplication.sharedApplication.windows) if (window.isKeyWindow) { parent = window.rootViewController.view; break; }
        }
        if (!parent) return;
        if (!views) views = [NSMutableDictionary new];
        NGEWebView* bridge = [NGEWebView new];
        bridge.messages = [NSMutableArray new]; bridge.requests = [NSMutableDictionary new]; bridge.html = @"";
        WKWebViewConfiguration* configuration = [WKWebViewConfiguration new];
        configuration.websiteDataStore = WKWebsiteDataStore.nonPersistentDataStore;
        [configuration setURLSchemeHandler:bridge forURLScheme:@"tide-app"];
        [configuration setURLSchemeHandler:bridge forURLScheme:@"tide-resource"];
        [configuration.userContentController addScriptMessageHandler:bridge name:@"tideui"];
        bridge.view = [[WKWebView alloc] initWithFrame:parent.bounds configuration:configuration];
        bridge.view.navigationDelegate = bridge;
        bridge.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [parent addSubview:bridge.view];
        result = ++nextView; views[@(result)] = bridge;
    });
    return result;
}

extern "C" JNIEXPORT void JNICALL Java_org_ngengine_libjglios_webview_NativeIosWebView_load(JNIEnv* env, jobject, jlong handle, jstring html) {
    NSString* source = javaString(env, html);
    onMain(^{ NGEWebView* bridge = views[@(handle)]; if (!bridge) return;
        bridge.html = source; [bridge.messages removeAllObjects];
        [bridge.view loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"tide-app://local/"]]];
    });
}

extern "C" JNIEXPORT void JNICALL Java_org_ngengine_libjglios_webview_NativeIosWebView_evaluate(JNIEnv* env, jobject, jlong handle, jstring script) {
    NSString* source = javaString(env, script);
    onMain(^{ NGEWebView* bridge = views[@(handle)];
        [bridge.view evaluateJavaScript:source completionHandler:^(id result, NSError* error) {
            if (error && views[@(handle)]) [bridge enqueue:@{@"type":@"error",@"message":@"WKWebView JavaScript execution failed"}];
        }];
    });
}

extern "C" JNIEXPORT jstring JNICALL Java_org_ngengine_libjglios_webview_NativeIosWebView_poll(JNIEnv* env, jobject, jlong handle) {
    __block NSString* result = nil;
    onMain(^{ NGEWebView* bridge = views[@(handle)]; if (bridge.messages.count) { result = bridge.messages.firstObject; [bridge.messages removeObjectAtIndex:0]; } });
    if (!result) return nullptr;
    NSData* data = [result dataUsingEncoding:NSUTF16LittleEndianStringEncoding];
    return env->NewString(reinterpret_cast<const jchar*>(data.bytes), static_cast<jsize>(data.length / 2));
}

extern "C" JNIEXPORT void JNICALL Java_org_ngengine_libjglios_webview_NativeIosWebView_beginResource(JNIEnv* env, jobject, jlong handle, jlong request, jint status, jstring mime, jlong length) {
    NSString* contentType = javaString(env, mime);
    onMain(^{ id<WKURLSchemeTask> task = views[@(handle)].requests[@(request)]; if (!task) return;
        NSMutableDictionary* headers = [@{@"Content-Type":contentType,@"Cache-Control":@"no-store",@"Access-Control-Allow-Origin":@"tide-app://local",@"X-Content-Type-Options":@"nosniff"} mutableCopy];
        if (length >= 0) headers[@"Content-Length"] = [NSString stringWithFormat:@"%lld",length];
        [task didReceiveResponse:[[NSHTTPURLResponse alloc] initWithURL:task.request.URL statusCode:status HTTPVersion:@"HTTP/1.1" headerFields:headers]];
    });
}

extern "C" JNIEXPORT void JNICALL Java_org_ngengine_libjglios_webview_NativeIosWebView_resourceChunk(JNIEnv* env, jobject, jlong handle, jlong request, jbyteArray bytes, jboolean finished) {
    jsize count = bytes ? env->GetArrayLength(bytes) : 0;
    if (count > 65536) return;
    NSMutableData* data = [NSMutableData dataWithLength:count];
    if (count) env->GetByteArrayRegion(bytes, 0, count, reinterpret_cast<jbyte*>(data.mutableBytes));
    onMain(^{ NGEWebView* bridge = views[@(handle)]; id<WKURLSchemeTask> task = bridge.requests[@(request)]; if (!task) return;
        if (data.length) [task didReceiveData:data];
        if (finished) { [task didFinish]; [bridge.requests removeObjectForKey:@(request)]; }
    });
}

extern "C" JNIEXPORT void JNICALL Java_org_ngengine_libjglios_webview_NativeIosWebView_close(JNIEnv*, jobject, jlong handle) {
    onMain(^{ NGEWebView* bridge = views[@(handle)]; if (!bridge) return;
        [views removeObjectForKey:@(handle)];
        [bridge.view stopLoading];
        [bridge.view.configuration.userContentController removeScriptMessageHandlerForName:@"tideui"];
        bridge.view.navigationDelegate = nil;
        for (id<WKURLSchemeTask> task in bridge.requests.allValues) [task didFailWithError:[NSError errorWithDomain:NSURLErrorDomain code:NSURLErrorCancelled userInfo:nil]];
        [bridge.requests removeAllObjects]; [bridge.view removeFromSuperview]; bridge.view = nil;
    });
}
