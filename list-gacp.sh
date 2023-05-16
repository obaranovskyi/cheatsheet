tree src | sed 1d | sed '$d' > content.md
git add .
git commit -a -m "auto commit"
git push
