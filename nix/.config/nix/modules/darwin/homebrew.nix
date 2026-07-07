{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = false;
      cleanup = "none";
    };

    taps = [
      "felixkratz/formulae"
      "atomicjar/tap"
    ];

    # Keep CLI tools in Nix where possible. Use Homebrew mainly for macOS GUI apps
    # and formulae/casks that are not available or convenient in nixpkgs.
    brews = [ ];

    casks = [
      "anki"
      "basictex"
      "discord"
      "figma"
      "brave-browser"
      "kitty"
      "linearmouse"
      "notion"
      "obsidian"
      "softmaker-freeoffice"
      "stats"
      "testcontainers-desktop"
      "thaw"
      "zed"
    ];
  };
}
