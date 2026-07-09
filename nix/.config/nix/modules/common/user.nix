{ ... }:

let
  username = "sangcci";
  homeDirectory = "/Users/${username}";
  homeDirectoryPath = /Users/sangcci;
  dotfilesDirectory = "${homeDirectory}/dotfiles";
in
{
  _module.args.userSettings = {
    inherit username homeDirectory homeDirectoryPath dotfilesDirectory;
  };

  users.users.${username}.home = homeDirectoryPath;
  system.primaryUser = username;
}
