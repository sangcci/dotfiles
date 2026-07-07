{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Neovim version manager
    bob-nvim

    # Native Neovim plugin / Treesitter parser build helpers
    tree-sitter
    gnumake
    clang

    # Runtime helpers referenced by Neovim plugins
    gotestsum

    # Nix editing support
    nil
    nixfmt
  ];
}
