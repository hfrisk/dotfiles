# ENV 
#-------------------------
$Env:EDITOR = "C:\Program Files\Neovim\bin\nvim.exe"
$Env:VISUAL = "C:\Program Files\Neovim\bin\nvim.exe"

# ALIASES
#-------------------------
Set-Alias -Name ls -Value eza -Option AllScope
Set-Alias -Name cd -Value z -Option AllScope
Set-Alias -Name vi -Value nvim 
Set-Alias -Name vim -Value nvim

# STARSHIP
#-------------------------
Invoke-Expression (&starship init powershell)

# ZOXIDE
#-------------------------
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# Skip fastfetch for non-interactive shells
if ([Environment]::GetCommandLineArgs().Contains("-NonInteractive")) {
  return
}
fastfetch
