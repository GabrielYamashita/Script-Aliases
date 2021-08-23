@echo off
doskey yacomp = cd /d "C:/Users/gabri/Documents/YACOMP"
doskey py = cd /d "C:/Users/gabri/Documents/YACOMP/python"
doskey html = cd /d "C:/Users/gabri/Documents/YACOMP/html"
doskey home = cd /d "C:/Users/gabri"

doskey create = git init $T curl -H "Authorization: token TOKEN" -H "Content-Type: application/json" https://api.github.com/user/repos -d "{\"name\": \"$1\"}" $T git remote add origin git@github.com:USER/$1.git $T git add . $T git commit -m "Initial Commit" $T git push --set-upstream origin master $T cls $T echo New repository ($1) created!
doskey commit = git add . $T git commit -m "$*" $T git push
doskey status = git status
