# Personally Created Choco packages

[Chocolatey Package Manager site](https://chocolatey.org/)


## Documentation Reference
[Build your own choco package](https://docs.chocolatey.org/en-us/create/create-packages)

```powershell
$packageName = 'windirstat'
$fileType = 'exe'
$url = 'http://prdownloads.sourceforge.net/windirstat/windirstat1_1_2_setup.exe'
$silentArgs = '/S'

Install-ChocolateyPackage $packageName $fileType $silentArgs $url

```


```powershell
choco new ShadowPC
```