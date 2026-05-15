#pragma once

#ifdef __cplusplus
extern "C" {
#endif

int libjglios_egl_init_with_metal_layer(void* metalLayer);
bool libjglios_egl_make_current(void);
void libjglios_egl_swap_buffers(void);
void libjglios_egl_set_framebuffer_size(int width, int height);
int libjglios_egl_framebuffer_width(void);
int libjglios_egl_framebuffer_height(void);
const char* libjglios_egl_last_error(void);
void libjglios_egl_shutdown(void);
void libjglios_input_enqueue_sdl_event(const void* event);
bool libjglios_input_poll_event(int intData[4], float floatData[4]);
void libjglios_app_request_quit(void);
void libjglios_app_reset_quit_request(void);
bool libjglios_app_quit_requested(void);
void libjglios_app_set_window(void* window);
bool libjglios_app_set_software_keyboard_visible(bool visible);
bool libjglios_device_rumble_supported(void);
void libjglios_device_rumble(float amount);

#ifdef __cplusplus
}
#endif
