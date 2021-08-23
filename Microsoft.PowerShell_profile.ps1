Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme material



function home { Set-Location "C:\Users\gabri" }
function yacomp { Set-Location "C:\Users\gabri\Documents\YACOMP" }
function html { Set-Location "C:\Users\gabri\Documents\YACOMP\html" }
function py { Set-Location "C:\Users\gabri\Documents\YACOMP\python" }



function new { mkdir $args ; Set-Location ".\$args" ; Clear-Host }
function back { Set-Location ".." ; Clear-Host }



$Token = 'USER:TOKEN'
$Base64Token = [System.Convert]::ToBase64String([char[]]$Token);
$Headers = @{
   Authorization = 'Basic {0}' -f $Base64Token;
};

function create { git init ; Invoke-RestMethod -Headers $Headers -Uri https://api.github.com/user/repos -Body "{""name"":""$($args[0])""}" -Method Post ; git remote add origin git@github.com:GabrielYamashita/$($args[0]).git ; git add . ; git commit -m "Initial Commit" ;  git push --set-upstream origin master ; Clear-Host ; Write-Host "New Repository ($($args[0])) Created!" -ForegroundColor green }
function status { git status }
function commit { git add . ; git commit -m "$args" ; git push ; Write-Host "Successful Commit ($args)!" -ForegroundColor green }
