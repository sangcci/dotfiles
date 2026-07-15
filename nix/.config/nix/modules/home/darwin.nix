{ config, ... }:

let
  dotfilesDirectory = "${config.home.homeDirectory}/dotfiles";

  dotfileMappings = [
    {
      target = ".config/aerospace";
      source = "aerospace/.config/aerospace";
    }
    {
      target = ".config/borders";
      source = "jankyborders/.config/borders";
    }
    {
      target = ".config/kitty/kitty.conf";
      source = "kitty/.config/kitty/kitty.conf";
    }
    {
      target = ".config/kitty/tab_bar.py";
      source = "kitty/.config/kitty/tab_bar.py";
    }
    {
      target = ".config/kitty/themes";
      source = "kitty/.config/kitty/themes";
    }
    {
      target = ".obsidian/snippets";
      source = "obsidian/.obsidian/snippets";
    }
  ];

  mkHomeFile = mapping: {
    name = mapping.target;
    value.source = config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/${mapping.source}";
  };
in
{
  home.stateVersion = "25.05";

  home.file = builtins.listToAttrs (map mkHomeFile dotfileMappings);
}
