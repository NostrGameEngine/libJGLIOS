#pragma once

#ifdef __cplusplus
extern "C" {
#endif

int libjglios_egl_init_with_metal_layer(void* metalLayer);
int libjglios_egl_init_with_sdl_window(void* window);
void libjglios_egl_set_pending_metal_layer(void* metalLayer);
void libjglios_egl_set_pending_sdl_window(void* window);
int libjglios_egl_init_pending(void);
bool libjglios_egl_is_initialized(void);
void libjglios_egl_configure_default_framebuffer(int redBits, int greenBits, int blueBits, int alphaBits, int depthBits, int stencilBits, int samples);
bool libjglios_egl_make_current(void);
void libjglios_egl_swap_buffers(void);
void libjglios_egl_set_framebuffer_size(int width, int height);
void libjglios_egl_set_display_metrics(int framebufferWidth, int framebufferHeight, int windowWidth, int windowHeight, float displayScale);
int libjglios_egl_framebuffer_width(void);
int libjglios_egl_framebuffer_height(void);
int libjglios_egl_window_width(void);
int libjglios_egl_window_height(void);
float libjglios_egl_display_scale(void);
const char* libjglios_egl_last_error(void);
void libjglios_egl_shutdown(void);
void libjglios_input_enqueue_sdl_event(const void* event);
bool libjglios_input_poll_event(int intData[5], float floatData[4]);
void libjglios_app_request_quit(void);
void libjglios_app_reset_quit_request(void);
bool libjglios_app_quit_requested(void);
void libjglios_app_set_window(void* window);
bool libjglios_app_set_software_keyboard_visible(bool visible);
bool libjglios_device_rumble_supported(void);
void libjglios_device_rumble(float amountHigh, float amountLow, float duration);
void libjglios_device_stop_rumble(void);

#ifdef __cplusplus
}
#endif
