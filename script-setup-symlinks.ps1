$DotfilesDir = "$HOME\dotfiles"

# List of dotfiles to symlink
$Dotfiles = @(
    @{Source="$DotfilesDir\.gitconfig"; Target="$HOME\.gitconfig"}
    @{Source="$DotfilesDir\.glzr"; Target="$HOME\.glzr"}
    @{Source="$DotfilesDir\Microsoft.PowerShell_profile.ps1"; Target="$PROFILE"}
    @{Source="$DotfilesDir\nvim"; Target="$HOME\AppData\Local\nvim"}
    @{Source="$DotfilesDir\settings.json"; Target="$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"}
    @{Source="$DotfilesDir\starship.toml"; Target="$HOME\.config\starship.toml"}
    @{Source="$DotfilesDir\startup-script.bat"; Target="$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\startup-script.bat"}
    @{Source="$DotfilesDir\takuya.omp.json"; Target="$HOME\Documents\PowerShell\takuya.omp.json"}
    @{Source="$DotfilesDir\wezterm"; Target="$HOME\.config\wezterm"}
)

foreach ($item in $Dotfiles) {
    $Source = $item.Source
    $Target = $item.Target

    # Ensure target directory exists
    $TargetDir = Split-Path -Path $Target -Parent
    if (!(Test-Path $TargetDir)) {
        New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
    }

    # Remove existing file/directory if not a symlink
    if (Test-Path $Target) {
        $ExistingItem = Get-Item $Target
        if ($ExistingItem.Attributes -match "ReparsePoint") {
            Write-Host "Symlink already exists: $Target -> $($ExistingItem.Target)" -ForegroundColor Yellow
            continue
        } else {
            Remove-Item $Target -Recurse -Force
        }
    }

    # Create symlink using cmd /c mklink
    if (Test-Path $Source -PathType Container) {
        # Create directory symlink
        cmd /c mklink /D "`"$Target`"" "`"$Source`""
        Write-Host "Created directory symlink: $Target -> $Source" -ForegroundColor Green
    } else {
        # Create file symlink
        cmd /c mklink "`"$Target`"" "`"$Source`""
        Write-Host "Created file symlink: $Target -> $Source" -ForegroundColor Cyan
    }
}

Write-Output "`nAll dotfiles have been symlinked successfully!"

