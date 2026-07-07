{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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

    # Monitoring / system info
    htop
    fastfetch
    dysk

    # Docs / utilities
    tlrc
    glow
    p7zip
  ];
}
