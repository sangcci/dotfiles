{ config, pkgs, ... }:

let
  dotfilesDirectory = "${config.home.homeDirectory}/dotfiles";

  dotfileMappings = [
    {
      target = ".config/bat";
      source = "bat/.config/bat";
    }
    {
      target = ".config/fzf";
      source = "fzf/.config/fzf";
    }
    {
      target = ".config/commitlint/config.cjs";
      source = "git/.config/commitlint/config.cjs";
    }
    {
      target = ".config/git/hooks";
      source = "git/.config/git/hooks";
    }
    {
      target = ".gitconfig";
      source = "git/.gitconfig";
    }
    {
      target = ".gitignore_global";
      source = "git/.gitignore_global";
    }
    {
      target = ".config/nix";
      source = "nix/.config/nix";
    }
    {
      target = ".config/nvim";
      source = "nvim/.config/nvim";
    }
    {
      target = ".config/yazi";
      source = "yazi/.config/yazi";
    }
    {
      target = ".zsh";
      source = "zsh/.zsh";
    }
    {
      target = ".zshrc";
      source = "zsh/.zshrc";
    }
  ];

  mkHomeFile = mapping: {
    name = mapping.target;
    value.source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/${mapping.source}";
  };
in
{
  home.username = "sangcci";
  home.homeDirectory = "/home/sangcci";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    # Core
    git
    curl
    wget
    stow
    zsh

    # Modern CLI
    fzf
    zoxide
    bat
    lsd
    fd
    ripgrep
    jq
    yazi

    # Git / GitHub
    gh
    delta

    # Monitoring and utilities
    htop
    fastfetch
    dysk
    tlrc
    glow
    p7zip

    # Neovim and Nix editing
    bob-nvim
    tree-sitter
    gnumake
    clang
    gotestsum
    nil
    nixfmt

    # Language tooling
    zip
    unzip
    gnused
    gawk
    uv
    nodejs_24
    bun
    go
    rustup
  ];

  home.file = builtins.listToAttrs (map mkHomeFile dotfileMappings);

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

}
