# tree src | sed 1d | sed '$d' > content.md
ls -l src | awk '{print $9}' | sed 's/.md//g' | nl > content.md
git add .
git commit -a -m "auto commit"
git push
