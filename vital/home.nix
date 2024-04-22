{ config, pkgs, ... }:

let darkTheme = false;

in {
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
      oh-my-zsh
      openssl
      pkg-config
      screen
      slack
      terraform
      thefuck
      tree
      unzip
      valgrind
      vim
      vscode
      websocat
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
      # `rm ~/.vscode/extensions/extensions.json` before `home-manager switch`
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        hashicorp.terraform
        justusadam.language-haskell
        vscodevim.vim
        ms-python.python
        ms-vscode-remote.remote-ssh
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
          version = "1.16.3";
          sha256 = "sha256-WHeLTN992ltEZw2W7B3sJrHfAFsOGMq3llV4C0hXLNA=";
        }
        {
          name = "tws";
          publisher = "jkiviluoto";
          version = "1.0.1";
          sha256 = "0aj58iasgnmd2zb7zxz587k9mfmykjwrb8h7hfvpkmh76s9bj4y5";
        }
        {
          name = "volar";
          publisher = "Vue";
          version = "1.8.6";
          sha256 = "sha256-EAS/1qYqTksJykS39tdAMIDz/cZaBIs1iH2HhhifVYw=";
        }
        {
          name = "vscode-typescript-vue-plugin";
          publisher = "Vue";
          version = "1.8.25";
          sha256 = "sha256-A4DEEMpcm2nAxQbeb7s1ar+hAlcexO5rjOg7wIBhNKY=";
        }
        {
          name = "vscode-typescript-next";
          publisher = "ms-vscode";
          version = "4.9.20220814";
          sha256 = "sha256-3uNqBljLPiGe76LJwvy/c53SVw7pgnW55nMcENjpxiI=";
        }
        {
          name = "sass-indented";
          publisher = "Syler";
          version = "1.8.22";
          sha256 = "sha256-i1z9WTwCuKrfU4AhdoSvGEunkk8gdStsod8jHTEnoFY=";
        }
        {
          name = "haskell";
          publisher = "haskell";
          version = "2.2.4";
          sha256 = "sha256-yJwQBs0Xo1Vn5Y2FEtQgOjKVfkhcJNWafYhMocRyW+M=";
        }
        {
          name = "terminal-command-keys";
          publisher = "petekinnecom";
          version = "0.3.0";
          sha256 = "sha256-oMbWlSAFdaOJR+zr240ICzis5qL8DnmTOzMxpEjNPW4=";
        }
        {
          name = "rust-analyzer";
          publisher = "rust-lang";
          version = "0.3.1868";
          sha256 = "sha256-FJ0/FdbipTSuJhPZL5ER3umiO+GlWJoxEncNXnmp8Po=";
        }
        {
          name = "markdown-all-in-one";
          publisher = "yzhang";
          version = "3.6.2";
          sha256 = "sha256-BIbgUkIuy8clq4G4x1Zd08M8k4u5ZPe80+z6fSAeLdk=";
        }
      ];
      userSettings = {
        "files.insertFinalNewline" = true;
        "files.trimFinalNewlines" = true;
        "workbench.editor.enablePreview" = false;
        "workbench.colorTheme" = if darkTheme then "Default Dark Modern" else "Default Light Modern";
        # "window.autoDetectColorScheme" = true;
        # "workbench.preferredDarkColorScheme" = "Default Dark Modern";
        # "workbench.preferredLightColorScheme" = "Default Light Modern";
        "files.exclude" = {
          "**/.git" = true;
          "**/.svn" = true;
          "**/.hg" = true;
          "**/CVS" = true;
          "**/.DS_Store" = true;
          "**/Thumbs.db" = true;
          "**/dist" = true;
          "**/dist-newstyle" = true;
          "**/result" = true;
        };
        "haskell.manageHLS" = "PATH";
        "rewrap.wrappingColumn" = 100;
        "rust-analyzer.server.path" = "rust-analyzer";
        "vim.insertModeKeyBindings" = [{
          "before" = ["<C-p>"];
          "commands" = ["workbench.action.quickOpen"];
        } {
          "before" = ["<C-w>"];
          "commands" = ["workbench.action.closeActiveEditor"];
        }];
        "vim.normalModeKeyBindings" = [{
          "before" = ["<C-p>"];
          "commands" = ["workbench.action.quickOpen"];
        } {
          "before" = ["<C-w>"];
          "commands" = ["workbench.action.closeActiveEditor"];
        }];
      };
      keybindings = [
        {
          key = "ctrl+space ctrl+f";
          command = "terminalCommandKeys.run";
          when = "editorFocus && editorLangId == haskell";
          args = {
            cmd = "fourmolu -i \${file}";
            showTerminal = false;
          };
        }
        {
          key = "alt+h";
          command = "workbench.action.toggleLightDarkThemes";
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
