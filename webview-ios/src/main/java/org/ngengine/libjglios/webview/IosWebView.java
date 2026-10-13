package org.ngengine.libjglios.webview;

/**
 * Standalone WKWebView bridge. Native calls marshal UIKit work to the main queue.
 * Polling keeps Graal isolates independent of callbacks from Objective-C threads.
 */
public interface IosWebView {
    /** Creates a view in the supplied UIView, or the app's root view when zero. */
    long create(long parentView);
    /** Loads a local UTF-8 HTML document at the private application origin. */
    void load(long handle, String html);
    void evaluate(long handle, String javascript);
    /** Returns the next JSON message, or null when the bounded native queue is empty. */
    String poll(long handle);
    void beginResource(long handle, long request, int status, String mime, long length);
    void resourceChunk(long handle, long request, byte[] bytes, boolean finished);
    void close(long handle);
}
