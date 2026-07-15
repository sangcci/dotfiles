{
  home-manager.users.sangcci = { };

  home-manager.sharedModules = [
    ../home/common.nix
    ../home/darwin.nix
  ];
}
