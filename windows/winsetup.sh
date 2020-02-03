#ensure correct cwd for ps
cd ~/dotfiles/windows

#dodge execution policy
powershell.exe -ExecutionPolicy UnRestricted -File PerformWindowsSetup.ps1

#go back to our old wd
popd > /dev/null 2>&1
