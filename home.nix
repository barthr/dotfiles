{ config, pkgs, ... }:

let
  ghosttyDesktopEntry = ''
    [Desktop Entry]
    Version=1.0
    Type=Application
    Name=Ghostty
    Comment=A terminal emulator
    Exec=${pkgs.ghostty}/bin/ghostty --gtk-single-instance=true
    Icon=com.mitchellh.ghostty
    Categories=System;TerminalEmulator;
    Terminal=false
    StartupNotify=true
    StartupWMClass=com.mitchellh.ghostty
  '';
in
{
  home.username = "bart";
  home.homeDirectory = "/home/bart";

  # Do not change this after the first successful Home Manager activation.
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    autojump
    fd
    git
    ghostty
    neovim
    ripgrep
    tmux
    xclip
    zsh
    lazygit
    codex
  ];

  # Keep the repository's existing configuration files as the source of truth.
  # Home Manager creates read-only links to the Nix store during activation.
  home.file = {
    ".tmux.conf".source = ./tmux/tmux.conf;
    ".config/ghostty".source = ./ghostty;
    ".config/mise/config.toml" = {
      source = ./mise/global.toml;
      force = true;
    };
    # Neovim updates its package lock file beside init.lua.
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/dotfiles/nvim";
    ".config/sway".source = ./sway;

    # Keep Ghostty visible both in the application launcher and on the desktop.
    ".local/share/icons/hicolor/256x256/apps/com.mitchellh.ghostty.png".source =
      "${pkgs.ghostty}/share/icons/hicolor/256x256/apps/com.mitchellh.ghostty.png";
    ".local/share/applications/com.mitchellh.ghostty.desktop".text = ghosttyDesktopEntry;
    "Desktop/Ghostty.desktop" = {
      text = ghosttyDesktopEntry;
      executable = true;
    };
  };

  # Make Fedora's graphics drivers available to Nix GUI applications.
  targets.genericLinux.enable = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases.vim = "nvim";
    history = {
      path = "${config.home.homeDirectory}/.zsh_history";
      size = 2147483647;
      save = 2147483647;
      append = true;
      share = true;
      extended = true;
      ignoreDups = true;
      ignoreAllDups = false;
      ignoreSpace = false;
      expireDuplicatesFirst = false;
      saveNoDups = true;
    };

    envExtra = ''
      [[ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]] &&
        source "$HOME/.nix-profile/etc/profile.d/nix.sh"

      # A compact, synchronous one-line Spaceship prompt.
      SPACESHIP_PROMPT_ORDER=(dir git exit_code char)
      SPACESHIP_RPROMPT_ORDER=()
      SPACESHIP_RPROMPT_ADD_NEWLINE=true
      SPACESHIP_PROMPT_ASYNC=false
      SPACESHIP_PROMPT_ADD_NEWLINE=false
      SPACESHIP_PROMPT_SEPARATE_LINE=false
    '';

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "spaceship-prompt";
        src = pkgs.spaceship-prompt;
        file = "lib/spaceship-prompt/spaceship.zsh";
      }
    ];

    initContent = ''
      source ${pkgs.autojump}/share/autojump/autojump.zsh

      bindkey '^ ' autosuggest-accept
      autoload -Uz edit-command-line
      zle -N edit-command-line

      bindkey '^[[1;5C' forward-word
      bindkey '^[[1;5D' backward-word
      bindkey '^[[H' beginning-of-line
      bindkey '^[[F' end-of-line
      bindkey '^[[3~' delete-char
      bindkey '^H' backward-kill-word
      bindkey '^[[3;5~' kill-word
      KEYTIMEOUT=1
    '';

    # This must load after widgets and every other plugin.
    syntaxHighlighting.enable = true;
  };

  programs.mise = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.home-manager.enable = true;
}
