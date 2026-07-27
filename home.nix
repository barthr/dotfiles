{ pkgs, ... }:

{
  home.username = "bart";
  home.homeDirectory = "/home/bart";

  # Do not change this after the first successful Home Manager activation.
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    fd
    fzf
    git
    ghostty
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
    ".zshrc".source = ./.zshrc;
    ".tmux.conf".source = ./tmux/tmux.conf;
    ".config/ghostty".source = ./ghostty;
    ".config/nvim".source = ./nvim;
    ".config/sway".source = ./sway;
  };

  programs.home-manager.enable = true;
}
