# tree src | sed 1d | sed '$d' > content.md
ls -l src | awk '{print $9}' | sed 's/.md//g' | nl 
git add .
git commit -a -m "auto commit"
git push
