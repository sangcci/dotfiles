{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # SDKMAN runtime dependencies. SDKMAN itself is installed under ~/.sdkman.
    curl
    zip
    unzip
    gnused
    gawk

    # Python toolchain manager
    uv

    # JavaScript / TypeScript runtimes and package manager helpers
    nodejs_24
    bun

    # Go
    go

    # Rust toolchain manager
    rustup
  ];
}
