{ config, pkgs, lib, ... }:

{
  imports = [
  ];

  home = {
    username = "dan";
    homeDirectory = "/home/dan/";

    file = {
      ".vimrc".source = ./vimrc;
      ".ghci".source = ./ghci;
    };

    packages = with pkgs; [
      bat
      jq
      openssl
      screen
      unzip
      vim
      yq
    ];

    sessionVariables = {
      EDITOR = "vi";
      TERM = "xterm-256color";
    };

    stateVersion = "24.11";
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

    man.enable = true;

    ssh.enable = true;
  };
}
