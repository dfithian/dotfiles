{ config, pkgs, ... }:

let
  pkgsUnstable = import
    (builtins.fetchTarball https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz)
    { config = config.nixpkgs.config; };
in
{
  imports = [
    /home/dan/vital-nix/user/feh-background.nix
    /home/dan/vital-nix/user/p53.nix
    /home/dan/vital-nix/user/software-workstation.nix
  ];

  home = {
    file = {
      ".gitconfig".source = ./gitconfig;
      ".vimrc".source = ./vimrc;
    };

    packages = with pkgs; [
      pkgsUnstable._1password-gui
      exa
      file
      firefox
      gimp
      glxinfo
      google-chrome
      inkscape
      oh-my-zsh
      slack
      vim
      vscode
      zoom-us
    ];

    sessionVariables = {
      EDITOR = "vi";
      TERM = "xterm-256color";
    };

    stateVersion = "20.03";
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
    home-manager.enable = true;

    git = {
      package = pkgs.gitAndTools.gitFull;
      enable = true;
      userName = "Dan Fithian";
      userEmail = "danielf@vitalbio.com";
      extraConfig = {
        core.editor = "$EDITOR";
      };
    };

    firefox = {
      enable = true;
      profiles.dan = {
        settings = {
          "browser.aboutConfig.showWarning" = false;
          "browser.search.region" = "US";
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
          "ui.systemUsesDarkTheme" = 1;
        };
      };
    };

    jq.enable = true;

    man.enable = true;

    vscode = {
      enable = true;
      package = pkgs.vscode;
      extensions = with pkgs.vscode-extensions; [
        bbenoist.Nix
        justusadam.language-haskell
        vscodevim.vim
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "vscode-relative-line-numbers";
          publisher = "extr0py";
          version = "0.0.5";
          sha256 = "0s0h56q29d7yysfs5nz0knr18kyqhmymdh4hxgkc8phl4zmyqjfh";
        }
        {
          name = "rewrap";
          publisher = "stkb";
          version = "1.15.4";
          sha256 = "1s55a78b61ly2fgg7mpnq09g0ard4hriqn6pplkwl6p1bc5g5rfa";
        }
        {
          name = "tws";
          publisher = "jkiviluoto";
          version = "1.0.1";
          sha256 = "0aj58iasgnmd2zb7zxz587k9mfmykjwrb8h7hfvpkmh76s9bj4y5";
        }
      ];
    };

    zsh = {
      enable = true;
      autocd = true;
      initExtra = ''
        start-agent() {
          if [ -z $SSH_AUTH_SOCK ]; then
            eval `ssh-agent -s` > /dev/null
          fi
          if [ -z $SSH_AGENT_PID ] && [ -z $SSH_TTY ]; then
            ssh-add ~/.ssh/id_rsa
          fi
        }

        start-agent
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "robbyrussell";
      };
      shellAliases = {
        ssh-tunnel = "ssh -fN";
      };
    };
  };

  xdg.configFile = {
  };

  xresources.properties = {
    # special
    "*.foreground"  = "#d1d1d1";
    # *.background:   #221e2d
    "*.cursorColor" = "#d1d1d1";

    # black
    "*.color0"   = "#272822";
    "*.color8"   = "#75715e";

    # red
    "*.color1"   = "#f92672";
    "*.color9"   = "#f92672";

    # green
    "*.color2"   = "#a6e22e";
    "*.color10"  = "#a6e22e";

    # yellow
    "*.color3"   = "#f4bf75";
    "*.color11"  = "#f4bf75";

    # blue
    "*.color4"   = "#66d9ef";
    "*.color12"  = "#66d9ef";

    # magenta
    "*.color5"   = "#ae81ff";
    "*.color13"  = "#ae81ff";

    # cyan
    "*.color6"   = "#a1efe4";
    "*.color14"  = "#a1efe4";

    # white
    "*.color7"   = "#f8f8f2";
    "*.color15"  = "#f9f8f5";

    "Xft.dpi"       = 192;
    "Xft.antialias" = true;
    "Xft.hinting"   = true;
    "Xft.rgba"      = "rgb";
    "Xft.autohint"  = false;
    "Xft.hintstyle" = "hintslight";
    "Xft.lcdfilter" = "lcddefault";

    "*termname"           = "xterm-256color";
    "dmenu.selforeground" = "#FFFFFF";
    "dmenu.background"    = "#000000";
    "dmenu.selbackground" = "#0C73C2";
    "dmenu.foreground"    = "#A0A0A0";
  };

  xsession = {
    enable = true;
    windowManager.command = "${pkgs.gnome3.gnome-session}/bin/gnome-session";
  };
}
