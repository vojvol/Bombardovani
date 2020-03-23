cls
@echo off
echo SNEKtech
echo Jak chcete pojmenovat zmenu?
set/p "zmena="
git add .
git commit -m "%zmena%"
git push -u origin master
pause