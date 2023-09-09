set -x WLR_RENDERER vulkan
set -x WLR_NO_HARDWARE_CURSORS 1
set -x XWAYLAND_NO_GLAMOR 1
set -x XDG_SESSION_TYPE wayland
set -x QT_QPA_PLATFORM wayland
set -x QT_WAYLAND_DISABLE_WINDOWDECORATION 1
set -x MOZ_ENABLE_WAYLAND 1
set -x MOZ_USE_XINPUT2 1
set -x GBM_BACKEND nvidia-drm
set -x __GL_GSYNC_ALLOWED 0
set -x __GL_VRR_ALLOWED 0
set -x __GLC_VENDOR_LIBRARY_NAME nvidia
set -x GTK_THEME Adwaita:dark
exec sway --unsupported-gpu -D noscanout
