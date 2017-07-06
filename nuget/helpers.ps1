$ids = Invoke-RestMethod `
        -Method Post `
        -Uri 'https://oss-stats.azurewebsites.net/api/NuGetOwnerPackages?code=ctkDTi550av8qz7pmTTCtL2yEemXdTI2TZsiQzCq2zxiMLDi3SpgZw==' `
        -Body '{"owners": ["cake-build","cake-contrib"]}'

$rows = @()

for($index = 0;$index -lt $packages.Count;$index+=4)
{
   $rows+=@(
     "'$($ids[$index].packageId)',".PadRight(35)
     "'$($ids[$index+1].packageId)',".PadRight(35)
     "'$($ids[$index+2].packageId)',".PadRight(35)
     "'$($ids[$index+3].packageId)',".PadRight(35)
   ) -join ' '
}
[string] $code = "$($rows -join [System.Environment]::NewLine)".Replace("'',", '').TrimEnd(',', ' ')
"@("
$code
")"
