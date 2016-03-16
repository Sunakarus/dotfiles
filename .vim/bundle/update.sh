#! /bin/bash
file="clone.sh"

if [ -f $file ] ; 
then
    rm $file
fi
touch $file
chmod +x $file

total=$(ls -l | grep -c ^d)
curr=1

for d in */ ; do
    cd $d
    url=$(git config --get remote.origin.url)
    if [[ ! -z $url ]] && [[ $url != *"Sunakarus/dotfiles"* ]]
    then
        echo "[$curr/$total] $url"
        echo "git clone $url" >> ../$file
        #git pull
    else
        echo "[$curr/$total] Not a git repository, skipping..."
    fi
    curr=$[$curr+1]
    cd ..
done
