{ userSettings, ... }:

let
  inherit (userSettings) username homeDirectory dotfilesDirectory;

  dotfileMappings = [
    {
      target = ".config/aerospace";
      source = "aerospace/.config/aerospace";
    }
    {
      target = ".config/bat/config";
      source = "bat/.config/bat/config";
    }
    {
      target = ".config/bat/themes";
      source = "bat/.config/bat/themes";
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
      target = ".gitconfig";
      source = "git/.gitconfig";
    }
    {
      target = ".gitignore_global";
      source = "git/.gitignore_global";
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
      target = ".config/nix";
      source = "nix/.config/nix";
    }
    {
      target = ".config/nvim";
      source = "nvim/.config/nvim";
    }
    {
      target = ".obsidian/snippets";
      source = "obsidian/.obsidian/snippets";
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
in
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.${username} = { config, ... }:
      let
        mkHomeFile = mapping: {
          name = mapping.target;
          value.source =
            config.lib.file.mkOutOfStoreSymlink "${dotfilesDirectory}/${mapping.source}";
        };
      in
      {
        home.username = username;
        home.stateVersion = "25.05";

        home.file = builtins.listToAttrs (map mkHomeFile dotfileMappings);
      };
  };
}
