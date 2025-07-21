# PowershellSettings

[![License: MIT-0](https://img.shields.io/badge/License-MIT%20No%20Attr-green.svg)](./LICENSE)

Reusable PowerShell configuration that bridges PowerShell 5.1 and PowerShell 7+ across Windows, macOS, and Linux.

---

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Folder Structure](#folder-structure)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [Attribution (AI Assistance)](#Attribution)
- [License](#license)

---

## Features

- **Cross-Edition Compatibility**  
  Works in legacy PowerShell 5.1 (Desktop) and modern PowerShell 7+ (Core).

- **Smart Toolchain Shims**  
  - Optional enforcement of `.cmd` shims for `pnpm` and `wasm-opt`  
  - Hyphen-free alias `wasmOpt`

- **UTF-8 Everywhere**  
  - Console encoding + BOM/no-BOM toggle  
  - Auto-`chcp 65001` on Windows PowerShell  
  - Sets `LANG=en_US.UTF-8` on macOS/Linux

- **Copilot Integration**  
  - Emits `ESC]133;C BEL` at prompt start  
  - Emits `ESC]133;D;<EXITCODE> BEL` on command exit  
  - Auto-registers/unregisters the exit-event handler

- **Enhanced Prompt**  
  Displays current path and Git branch:  
  ```text
  PS C:\path\to\repo (main)> 

- **Helper Functions & Aliases**
  - Explicit wrapper functions to let pnpm and wasm-opt ensure they work as they do in Powershell 5.1
	- wasmOpt alias function for wasm-opt
- ** Optional built-in TinyGo pathing fix

## Installation

1. **Add to your repo**  
   ```bash
   git submodule add https://github.com/BlazesRus/PowershellSettings PowershellSettings
	
2. Place the terminal script in your VS Code workspace or user profile(either of 2 options):
  - **VS Code Workspace Settings (.code-workspace)**:
  ```
	{
		"terminal.integrated.profiles.windows": {
			"PowerShell 7": {
				"path": [
					"${env:ProgramFiles}\\PowerShell\\7\\pwsh.exe",
					"${env:ProgramFiles(x86)}\\PowerShell\\7\\pwsh.exe",
					"pwsh.exe"
				],
				"icon": "terminal-powershell",
				"args": [
					"-NoLogo",
					"-NoExit",
					"-ExecutionPolicy", "Bypass",
					"-Command",
					"& \"${workspaceFolder:projectroot}/PowershellSettings/PowerShellTerminal.ps1\""
				],
				"overrideName": true
			}
		},
		"terminal.integrated.defaultProfile.windows": "PowerShell 7",
		"terminal.integrated.automationProfile.windows": "PowerShell 7"
	}
  ```

  - **Extending a User Profile with this profile ($PROFILE in PowerShell)**:
	# In your $PROFILE (e.g. $HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1)
	& "$HOME\path\to\PowershellSettings\PowerShellTerminal.ps1"


3. In your PowerShell script or profile, dot-source the module:

	#Adjust the $profilePath to actual PowershellSettings path
	$profilePath = Join-Path $PSScriptRoot 'PowershellSettings' 'PowerShellTerminal.ps1'
	if (Test-Path $profilePath) {
      . $profilePath
	} else {
      throw "Profile not found at $profilePath"
	}

	
4. Create and customize PowershellSettings/ProfileSettings.psd1.

---

## Usage

- **Prepending a pathDirectory (or file) to path**
	Prepend-PathEntry pathToPrepend
	
- **Manually Emit Copilot Done Marker**
  After a long-running task, type:
  done
  in console.

- **Null-Coalescing in PS 5.1**
	$value = NullCheck { $possiblyNull } { Get-DefaultValue }

- **TinyGo build fix (if enabled)**
   Automatically runs at startup.

---

## Configuration

Edit PowershellSettings/ProfileSettings.psd1 to control profile behavior

---

## Folder Structure

PowershellSettings/
├─ ProfileSettings.psd1    # User-tweakable settings
├─ PowerShellTerminal.ps1  # Core profile logic
└─ …                       # (Optional helpers, future scripts)

---

## Troubleshooting

- **`node.exe` not found**
 Ensure your Node install folder is in the system/user PATH before launching PowerShell 7(Optionally reinstall Node.js as fix).

- **EPERM on `pnpm.CMD`**
  1. Run PowerShell as Administrator
  2. enable corepack manually by either:
    corepack prepare pnpm@latest --activate
    or
    corepack enable pnpm

- **Invalid ProfileSettings.psd1**
  Ensure it is a pure hashtable literal (@{ key = value; }) with no in-table assignments.

- **Copilot markers not detected**
  Confirm your terminal emulator forwards ANSI OSC sequences (ESC]…BEL).

## Contributing

1. Fork this repo and create a branch.  
2. Update `ProfileSettings.psd1` defaults or add features.  
3. Submit a PR with clear descriptions.

---

## Attribution (AI Assistance)

This PowerShell profile was originally generated using GitHub Copilot and further enhanced with support from Microsoft Copilot to better handle PowerShell 5.1 syntax, improve clarity, toolchain detection, developer ergonomics, and streamline cross-platform tooling.
Contributing

This profile was crafted for clarity and cross-edition reliability. If you have enhancements or platform-specific fixes, feel free to open a pull request or issue.

---

## License

MIT No Attribution (MIT-0) – see [LICENSE](./LICENSE).
