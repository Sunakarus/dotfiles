#! /bin/bash
file="clone.sh"

if [ -f $file ] ; 
then
    rm $file
fi
touch $file
chmod +x $file

for d in */ ; do
    cd $d
    echo "$(git config --get remote.origin.url)"
    echo "git clone $(git config --get remote.origin.url)" >> ../$file
    git pull
    cd ..
done
