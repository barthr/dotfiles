## Dotfiles

Personal configuration for Linux and macOS. On Linux, this repository is
managed with a Nix flake and Home Manager.

### First-time setup (Linux)

Nix needs flakes enabled. Add this to `~/.config/nix/nix.conf` (create the
file and parent directory if needed):

```ini
experimental-features = nix-command flakes
```

Then activate this configuration from the repository root:

```sh
nix run github:nix-community/home-manager -- switch --flake .#bart --backup-file-extension pre-home-manager
```

The backup suffix matters on the first run: it preserves the existing
dotfile symlinks before Home Manager replaces them with Nix-managed links.

### Daily use

After changing a dotfile or `home.nix`, apply it with:

```sh
home-manager switch --flake .#bart
```

To update the pinned Nix packages and Home Manager inputs:

```sh
nix flake update
home-manager switch --flake .#bart
```

The initial managed package set is intentionally small and supports the
checked-in shell, tmux, and Neovim configuration. Add packages to
`home.packages` in `home.nix` as you make more tools declarative.
