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

# TAB COMPLETION
#-------------------------
Set-PSReadLineKeyHandler -Key Tab `
                         -BriefDescription ForwardCharAndAcceptNextSuggestionWord `
                         -LongDescription "Move cursor one character to the right in the current editing line and accept the next word in suggestion when it's at the end of current editing line" `
                         -ScriptBlock {
    param($key, $arg)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

    if ($cursor -lt $line.Length) {
        [Microsoft.PowerShell.PSConsoleReadLine]::ForwardChar($key, $arg)
    } else {
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptSuggestion($key, $arg)
    }
}

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
