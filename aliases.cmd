@echo off

:: Função para ir para um Diretório específico:
doskey path = cd /d "C:/Users/"

:: Cria nova pasta e vai para ela:
doskey new = mkdir $* $T cd $* $T cls

:: Volta para o diretório anterior:
doskey back = cd .. &T cls

:: Funções do Github
:: Settings
set USER=USER & REM Substituir USER pelo user do github (sem espaço depois da ,).
set TOKEN=TOKEN & REM Substituir TOKEN pelo token gerado (sem espaço depois da ,).

:: Cria um repositório do zero e adiciona tuda a ele:
doskey create = git init $T curl -H "Authorization: token %TOKEN%" -H "Content-Type: application/json" https://api.github.com/user/repos -d "{\"name\": \"$1\"}" $T git remote add origin git@github.com:%USER%/$1.git $T git add . $T git commit -m "Initial Commit" $T git push --set-upstream origin master $T cls $T echo New repository ($1) created!

:: Git Status:
doskey status = git status

:: Commit com a mensagem desejada:
doskey commit = git add . $T git commit -m "$*" $T git push
