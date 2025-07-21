<#
  ProfileSettings.psd1

  This file holds configuration for PowerShell Profile
#>

@{
  # If true, Force PowerShell 7 to Use the “.cmd” shims instead of ps1 files
  forceCmdShims     = $true

  # If true, forces UTF8 encoding
  forceUTF8         = $true

  # If false, make all Out-File/Set-Content/Add-Content/Export-Csv use UTF-8 without BOM
  # Otherwise, make all Out-File/Set-Content/Add-Content/Export-Csv use UTF-8 with BOM
  useBOM            = $true

  # If true, enable TinyGo fix(auto-prepend goRoot--ensures go is in front of path)
  enableTinyGoFix   = $false

  # TinyGo & Go paths
  tinygoExe         = 'C:\PLanguages\tinygo\bin\tinygo.exe'
  goRoot            = 'C:\PLanguages\Go\bin'
}