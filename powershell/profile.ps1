# ENV 
#-------------------------
$Env:EDITOR = "C:/Program Files/Neovim/bin/nvim.exe"
$Env:VISUAL = "C:/Program Files/Neovim/bin/nvim.exe"

# jdk
$JAVA_HOME = "C:\Users\linku\.jdks\openjdk-24.0.1"

$Env:YAZI_CONFIG_HOME = "%UserProfile%\.dots\yazi"
$Env:YAZI_FILE_ONE = "C:\Program Files\Git\usr\bin\file.exe"

# ALIASES
#-------------------------

#Set-Alias -Name cat -Value bat
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

# USEFUL FUNCTIONS
# ------------------------

#symlinker
function make-link ($target, $link) {
    #Reminder: Target is where the real file is.
    New-Item -Path $link -ItemType SymbolicLink -Value (Resolve-Path $target)
}

function move-and-link ($origin, $target) {
    Move-Item -Path $origin -Destination $target
    make-link $target $origin
}

#yazi shell wrapper
function y {
    $tmp = (New-TemporaryFile).FullName
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
    }
    Remove-Item -Path $tmp
}
#fuzzy search, open yazi
function fzo ($directory) {
    y $(fzf -d $directory)
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
