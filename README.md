# PowershellSettings

Reusable PowerShell configuration module that bridges compatibility between legacy PowerShell 5.1 syntax and modern PowerShell 7.x environments.

---

## Features

- 🔧 **Cross-edition compatibility**  
  Supports PowerShell 5.1 syntax while executing seamlessly in PowerShell 7.0+ environments.

- 🧠 **Smart alias and command discovery**  
  Automatically detects platform-dependent developer tools (Node.js, pnpm, Go, TinyGo, wasm-opt, etc.) and exposes them via consistent aliases.

- 🎨 **Structured terminal output**  
  Verbose, color-coded messaging for improved developer experience and log readability.

- 🛠️ **Profile-enhanced sessions**  
  Automatically dot-sources this module from scripts or projects for a unified CLI experience.

- 🚦 **Fallback and error resilience**  
  Warns gracefully when expected commands or paths are missing, with clear guidance for remediation.

---

## Installation

You can clone or submodule this into any repository:

```bash
git submodule add https://github.com/BlazesRus/PowershellSettings PowershellSettings

---

## Usage

In your PowerShell script or profile, dot-source the module:

#Adjust the $profilePath to actual PowershellSettings path
$profilePath = Join-Path $PSScriptRoot 'PowershellSettings' 'Microsoft.PowerShell_profile.ps1'
if (Test-Path $profilePath) {
    . $profilePath
} else {
    Write-Error "Shared profile not found at $profilePath"
    throw
}

Now all aliases and detection logic are active in your session.

---

## Folder Structure

- `Microsoft.PowerShell_profile.ps1` — core profile logic 

---

## Attribution (AI Assistance)

This PowerShell profile was originally generated using GitHub Copilot and further enhanced with support from Microsoft Copilot to better handle PowerShell 5.1 syntax, improve clarity, toolchain detection, developer ergonomics, and streamline cross-platform tooling.
Contributing

This profile was crafted for clarity and cross-edition reliability. If you have enhancements or platform-specific fixes, feel free to open a pull request or issue.

---

## License

This folder is licensed under MIT No Attribution (MIT-0). See LICENSE for details.
