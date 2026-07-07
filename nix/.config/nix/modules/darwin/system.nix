{ self, ... }:

{
  # Determinate Systems manages Nix installation and updates.
  nix.enable = false;

  nix.settings.experimental-features = "nix-command flakes";

  security.pam.services.sudo_local = {
    enable = true;
    touchIdAuth = true;
    reattach = false;
  };

  system.primaryUser = "sangcci";

  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = 6;

  nixpkgs.hostPlatform = "aarch64-darwin";
}
