package org.ngengine.libjglios.webview;

/** JNI entry points supplied by the statically linked libJGLIOSWebView framework. */
public final class NativeIosWebView implements IosWebView {
    @Override public native long create(long parentView);
    @Override public native void load(long handle, String html);
    @Override public native void evaluate(long handle, String javascript);
    @Override public native String poll(long handle);
    @Override public native void beginResource(long handle, long request, int status, String mime, long length);
    @Override public native void resourceChunk(long handle, long request, byte[] bytes, boolean finished);
    @Override public native void close(long handle);
}
