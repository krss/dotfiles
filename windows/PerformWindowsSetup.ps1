If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
  # Relaunch as an elevated process:
  Write-Output "Attempting priviledge escalation for Windows symlink creation"
  Start-Process powershell.exe "-ExecutionPolicy unrestricted -File",('"{0}"' -f $MyInvocation.MyCommand.Path) -Verb RunAs
  exit
}
# Now running elevated so launch the script:
Write-Output "Privileges Escalated, creating symlinks"

$Junctions = @(
    @("$env:Appdata\Code\User", "vscode\User"),
    ("","")
)
$Shortcuts= @(
    @("$env:Appdata\Microsoft\Windows\Start Menu\Programs\Startup\capstesc.lnk", "utils\capstoesc.ahk"),
    ("","")
)
function New-Shortcut {
    param (
        $source, $target
    )
    if ($source -ne "") {
        $SourceFileLocation = $(Join-Path $PSScriptRoot $source)
        $WScriptShell = New-Object -ComObject WScript.Shell
        $Shortcut = $WScriptShell.CreateShortcut($target)
        $Shortcut.TargetPath = $SourceFileLocation
        $Shortcut.Save()
    }
}
foreach ($shortcut in $Shortcuts) {
    $target, $source = $shortcut
    New-Shortcut -source $source -target $target
}

function Add-Symlink {
    param ( $path, $location)
    if ($path -ne "") {
        Remove-Item -force -path $path
        pause
        new-item -itemtype Junction -path $path -target $(Join-Path $PSScriptRoot $location)
    }
}
foreach ($link in $Junctions) {
    $path, $target = $link
    Add-Symlink -path $path -location $target
}
Write-Output "Done."
Pause