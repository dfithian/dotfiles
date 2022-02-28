# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf.settings = {
    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "us" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" "caps:ctrl_modifier" ];
    };

    "org/gnome/desktop/interface" = {
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      gtk-im-module = "gtk-im-context-simple";
      gtk-theme = "Materia-dark";
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "gnome-power-panel" "slack" "firefox" "zoom" "org-gnome-terminal" "1password" "code" ];
    };

    "org/gnome/desktop/notifications/application/1password" = {
      application-id = "1password.desktop";
    };

    "org/gnome/desktop/notifications/application/code" = {
      application-id = "code.desktop";
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-terminal" = {
      application-id = "org.gnome.Terminal.desktop";
    };

    "org/gnome/desktop/notifications/application/slack" = {
      application-id = "slack.desktop";
    };

    "org/gnome/desktop/notifications/application/zoom" = {
      application-id = "Zoom.desktop";
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };

    "org/gnome/desktop/privacy" = {
      disable-microphone = false;
    };

    "org/gnome/epiphany/state" = {
      is-maximized = false;
      window-position = mkTuple [ (-1) (-1) ];
      window-size = mkTuple [ 1024 768 ];
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
      network-monitor-gio-name = "";
    };

    "org/gnome/mutter" = {
      attach-modal-dialogs = true;
      dynamic-workspaces = true;
      edge-tiling = true;
      focus-change-on-pointer-rest = true;
      workspaces-only-on-primary = true;
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "icon-view";
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 890 550 ];
      maximized = false;
    };

    "org/gnome/shell" = {
      disable-user-extensions = true;
      favorite-apps = [ "org.gnome.Terminal.desktop" "slack.desktop" "code.desktop" "1password.desktop" "google-chrome.desktop" ];
      welcome-dialog-last-shown-version = "40.1";
    };

    "org/gnome/shell/world-clocks" = {
      locations = "@av []";
    };

    "org/gnome/terminal/legacy" = {
      default-show-menubar = true;
      schema-version = 3;
      theme-variant = "dark";
    };

    "org/gnome/terminal/legacy/profiles:" = {
      default = "default";
      list = [ "default" ];
    };

    "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
      audible-bell = false;
    };

    "org/gnome/terminal/legacy/profiles:/:default" = {
      audible-bell = false;
      background-color = "#75715e";
      backspace-binding = "ascii-delete";
      bold-color-same-as-fg = true;
      cursor-background-color = "#272822";
      cursor-blink-mode = "system";
      cursor-colors-set = true;
      cursor-foreground-color = "#d1d1d1";
      cursor-shape = "block";
      delete-binding = "delete-sequence";
      foreground-color = "#f8f8f2";
      highlight-colors-set = false;
      login-shell = false;
      palette = [];
      scrollback-lines = 10000;
      scrollbar-policy = "always";
      use-custom-command = false;
      use-system-font = true;
      use-theme-colors = false;
      visible-name = "default";
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/settings/file-chooser" = {
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 153;
      sort-column = "name";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 345 81 ];
      window-size = mkTuple [ 1231 902 ];
    };

  };
}