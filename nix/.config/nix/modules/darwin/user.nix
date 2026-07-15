{ ... }:

let
  username = "sangcci";
  homeDirectory = /Users/sangcci;
in
{
  users.users.${username}.home = homeDirectory;
  system.primaryUser = username;
}
