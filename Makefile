


pull:
    git fetch
    git merge origin/main

push:
    git add .
    git commit -m "fix typo"
    git push origin main

deploy: pull
