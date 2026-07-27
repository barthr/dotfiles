{ pkgs, nixgl, ... }:

let
  ghosttyWithNixGL = pkgs.writeShellScriptBin "ghostty" ''
    exec ${nixgl.packages.${pkgs.system}.nixGLIntel}/bin/nixGLIntel ${pkgs.ghostty}/bin/ghostty "$@"
  '';

  ghosttyDesktopEntry = ''
    [Desktop Entry]
    Version=1.0
    Type=Application
    Name=Ghostty
    Comment=A terminal emulator
    Exec=${ghosttyWithNixGL}/bin/ghostty --gtk-single-instance=true
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
    fd
    git
    ghosttyWithNixGL
    neovim
    ripgrep
    tmux
    xclip
    zsh
    lazygit
  ];

  # Keep the repository's existing configuration files as the source of truth.
  # Home Manager creates read-only links to the Nix store during activation.
  home.file = {
    ".tmux.conf".source = ./tmux/tmux.conf;
    ".config/ghostty".source = ./ghostty;
    ".config/nvim".source = ./nvim;
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

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;

    envExtra = ''
      [[ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]] &&
        source "$HOME/.nix-profile/etc/profile.d/nix.sh"
    '';

    plugins = [
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions;
        file = ".";
      }
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

    # This must load after widgets and every other plugin.
    syntaxHighlighting.enable = true;
  };

  programs.mise = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.home-manager.enable = true;
}
