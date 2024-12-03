{ config, pkgs, lib, ... }:

{
  imports = [
    /home/dan/vital-nix/user/feh-background.nix
    /home/dan/vital-nix/user/thinkpad.nix
    /home/dan/vital-nix/user/software-workstation.nix
  ];

  services.lorri = {
    enable = true;
  };

  home = {
    file = {
      ".vimrc".source = ./vimrc;
      ".ghci".source = ./ghci;
    };

    packages = with pkgs; [
      _1password-gui
      awscli
      bat
      bind
      direnv
      docker
      eza
      file
      firefox
      gimp
      glxinfo
      gnomeExtensions.appindicator
      gnomeExtensions.system-monitor
      google-chrome
      graphviz
      qcachegrind
      inkscape
      nixfmt
      oh-my-zsh
      openssl
      pkg-config
      screen
      slack
      thefuck
      tree
      unzip
      valgrind
      vim
      vscode
      websocat
      yq
      zoom-us
    ];

    sessionVariables = {
      EDITOR = "vi";
      TERM = "xterm-256color";
    };

    stateVersion = "20.03";
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "adobe-reader-9.5.5"
    ];
  };

  programs = {
    home-manager.enable = true;

    git = {
      package = pkgs.gitAndTools.gitFull;
      enable = true;
      userName = "Dan Fithian";
      userEmail = "danielf@vitalbio.com";
      extraConfig = {
        core = {
          editor = "$EDITOR";
        };
        pager.branch = false;
        pull.rebase = false;
      };
      ignores = [ "dist-newstyle" ];
    };

    gnome-terminal = {
      enable = true;
      profile = {
        "00000000-0000-0000-0000-000000000000" = {
          default = true;
          allowBold = true;
          audibleBell = false;
          scrollbackLines = 100000;
          transparencyPercent = 0;
          visibleName = "default";
        };
      };
    };

    firefox.enable = true;

    jq.enable = true;

    man.enable = true;

    ssh = {
      enable = true;
      matchBlocks = {
        "beast.vital.company" = {
          host = "beast";
          hostname = "beast.vital.company";
          forwardAgent = true;
        };
      };
    };

    vscode = {
      enable = true;
      package = pkgs.vscode;
      mutableExtensionsDir = true;
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

        eval "$(direnv hook zsh)"
      '';
      envExtra = ''
        export PATH="$PATH:$HOME/.cargo/bin"
      '';
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "thefuck" ];
        theme = "robbyrussell";
      };
      shellAliases = {
        ssh-tunnel = "ssh -fN";
      };
    };
  };

  xdg.configFile = { };

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
  };

  xsession = {
    enable = true;
    windowManager.command = "${pkgs.gnome3.gnome-session}/bin/gnome-session";
  };
}
