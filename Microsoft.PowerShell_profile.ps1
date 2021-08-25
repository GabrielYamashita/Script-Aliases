
# Função para ir para um Diretório específico:
function path { Set-Location "C:\Users" }

# Cria nova pasta e vai para ela:
function new { mkdir $args ; Set-Location ".\$args" ; Clear-Host }

# Volta para o diretório anterior:
function back { Set-Location ".." ; Clear-Host }

# Funções do Github:

# Settings:
$USER = 'USER' # Substituir USER pelo user do github
$TOKEN = 'TOKEN' # Substituir TOKEN pelo token gerado.

$Pass = "$($USER):$($TOKEN)"
$Base64Token = [System.Convert]::ToBase64String([char[]]$Pass);
$Headers = @{
   Authorization = 'Basic {0}' -f $Base64Token;
};

# Cria um repositório do zero e adiciona tuda a ele:
function create { git init ; Invoke-RestMethod -Headers $Headers -Uri https://api.github.com/user/repos -Body "{""name"":""$($args[0])""}" -Method Post ; git remote add origin git@github.com:$USER/$($args[0]).git ; git add . ; git commit -m "Initial Commit" ;  git push --set-upstream origin master ; Clear-Host ; Write-Host "New Repository ($($args[0])) Created!" -ForegroundColor green }

# Git Status:
function status { git status }

# Commit com a mensagem desejada:
function commit { git add . ; git commit -m "$args" ; git push ; Write-Host "Successful Commit ($args)!" -ForegroundColor green }
