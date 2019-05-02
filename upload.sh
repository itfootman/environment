#! /bin/bash
for folder in `ls .`
do
    echo "######$folder"
    if [ -d $folder ]; then
        cp ~/.vim/.gitignore $folder
        cd $folder
        git init .
        git add .
        git commit -m "First commit $folder."
        git remote add origin https://github.com/itfootman/$folder.git
        git push -u origin master
        cd ~/.vim/bundle 
    fi
done 
