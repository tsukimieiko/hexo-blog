info=$1
if ["$info" = ""];
then info=":frog:update content"
fi
git add -A
git commit -m "$info"
git push origin hexo