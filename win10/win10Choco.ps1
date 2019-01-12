
## Uncomment to install Chocolatey
# @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin

# https://http://chocolatey.org/packages/<name>

# Normal Programs
cinst -y chromium
cinst -y firefox

# Dev Tools
cinst -y vscode
cinst -y hyper
cinst -y notepadplusplus
cinst -y slack
cinst -y insomnia-rest-api-client

