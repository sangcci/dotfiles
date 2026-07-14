# windows

Windows host configuration managed with PowerShell.

This package intentionally manages the **Windows host** only. WSL is a Linux environment and should be managed separately with Nix/Home Manager. Do not use GNU Stow for this directory: Windows configuration is applied explicitly by `bootstrap.ps1`.

## Included settings

- Disables **Enhance pointer precision** (mouse acceleration) for the current user.
- Applies reversible UI preferences: visible file extensions, hidden Task View and Widgets buttons, fewer Start recommendations, disabled Start web suggestions, the classic context menu, and disabled minimize/maximize animations.
- Verifies that `winget` is available. This setup does not install or remove applications.

## Apply

Open PowerShell in the cloned dotfiles repository and run:

```powershell
powershell -ExecutionPolicy Bypass -File .\windows\bootstrap.ps1
```

No administrator privileges are needed for the current settings. Sign out and back in, or restart, after applying the mouse setting.

To skip the mouse setting:

```powershell
powershell -ExecutionPolicy Bypass -File .\windows\bootstrap.ps1 -SkipMouse
```

## Layout

```text
windows/
├── bootstrap.ps1              # Applies all host settings
├── scripts/
│   └── confirm-winget.ps1     # Checks that winget is available
└── settings/
    ├── mouse.ps1              # Mouse acceleration setting
    └── ui.ps1                 # Reversible Windows UI preferences
```

Add future Windows settings under `settings/`. Package installation should be added as an explicit `winget` script rather than being hidden inside individual settings scripts.
