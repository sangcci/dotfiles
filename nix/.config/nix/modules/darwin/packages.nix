{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # macOS-only tools
    aerospace
  ];
}
