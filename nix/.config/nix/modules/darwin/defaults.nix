{
  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
      mru-spaces = false;
    };

    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      ShowStatusBar = true;
    };

    NSGlobalDomain = {
      ApplePressAndHoldEnabled = false;
      InitialKeyRepeat = 15;
      KeyRepeat = 2;
      AppleShowScrollBars = "Always";
    };
	
	CustomUserPreferences = {
      NSGlobalDomain = {
        NSSplitViewItemSidebarDefaultsToFloatingAppearance = false;
        NSSplitViewItemGlassMinimumCornerRadius = 4;
        NSConvolutionOverride1 = 8;
      };
    };
  };
}
