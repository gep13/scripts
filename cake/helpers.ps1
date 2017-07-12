[string[]] $tasks = Get-Content .\build.cake|Select-String -Pattern 'Task\("(.*?)"\)' | % Matches | % {$_.Groups[1].Value}
