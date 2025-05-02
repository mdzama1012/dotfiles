#!/bin/bash

# Function to get DE
get_de() {
  if [[ -n "$XDG_CURRENT_DESKTOP" ]]; then
    echo "$XDG_CURRENT_DESKTOP"
  elif [[ -n "$DESKTOP_SESSION" ]]; then
    echo "$DESKTOP_SESSION"
  elif [[ -n "$GNOME_DESKTOP_SESSION_ID" ]]; then
    echo "GNOME"
  elif [[ -n "$KDE_SESSION_VERSION" ]]; then
    echo "KDE"
  elif [[ -n "$(pgrep -x cinnamon)" ]]; then
    echo "Cinnamon"
  elif [[ -n "$(pgrep -x mate-session)" ]]; then
    echo "MATE"
  elif [[ -n "$(pgrep -x lxsession)" ]]; then
    echo "LXDE"
  elif [[ -n "$(pgrep -x xfce4-session)" ]]; then
    echo "XFCE"
  else
    echo "Unknown"
  fi
}

# Function to get Compositor
get_compositor() {
  if [[ -n "$(pgrep -x picom)" ]]; then
    echo "Picom"
  elif [[ -n "$(pgrep -x compton)" ]]; then
    echo "Compton"
  elif [[ -n "$(pgrep -x mutter)" ]]; then
    echo "Mutter"
  elif [[ -n "$(pgrep -x kwin_x11)" || -n "$(pgrep -x kwin_wayland)" ]]; then
    echo "KWin"
  elif [[ -n "$(pgrep -x gnome-shell)" ]]; then
      echo "Mutter (GNOME Shell)"
  elif [[ -n "$(pgrep -x xfwm4)" ]]; then
      echo "Xfwm4"
  elif [[ -n "$(pgrep -x marco)" ]]; then
      echo "Marco"
  elif [[ -n "$(pgrep -x compton)" ]]; then
      echo "Compton"
  else
    echo "None or Unknown"
  fi
}

# Function to get Display Server
get_display_server() {
  if [[ -n "$WAYLAND_DISPLAY" ]]; then
    echo "Wayland"
  elif [[ -n "$DISPLAY" ]]; then
    echo "X11"
  else
    echo "Unknown"
  fi
}

# Function to get Window Manager
get_window_manager() {
  if [[ -n "$(pgrep -x i3)" ]]; then
    echo "i3"
  elif [[ -n "$(pgrep -x bspwm)" ]]; then
    echo "bspwm"
  elif [[ -n "$(pgrep -x awesome)" ]]; then
    echo "Awesome"
  elif [[ -n "$(pgrep -x dwm)" ]]; then
    echo "dwm"
  elif [[ -n "$(pgrep -x herbstluftwm)" ]]; then
    echo "herbstluftwm"
  elif [[ -n "$(pgrep -x openbox)" ]]; then
    echo "Openbox"
  elif [[ -n "$(pgrep -x xfwm4)" ]]; then
      echo "Xfwm4"
  elif [[ -n "$(pgrep -x mutter)" ]]; then
    echo "Mutter"
  elif [[ -n "$(pgrep -x kwin_x11)" || -n "$(pgrep -x kwin_wayland)" ]]; then
    echo "KWin"
  elif [[ -n "$(pgrep -x marco)" ]]; then
    echo "Marco"
  elif [[ -n "$(pgrep -x gnome-shell)" ]]; then
      echo "GNOME Shell"
  else
    echo "Unknown"
  fi
}

# Print the results
echo "System Information:"
echo "-------------------"
echo "Desktop Environment: $(get_de)"
echo "Compositor: $(get_compositor)"
echo "Display Server: $(get_display_server)"
echo "Window Manager: $(get_window_manager)"
