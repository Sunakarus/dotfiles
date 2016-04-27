#! /bin/bash
#pass -g flag to generate clone.sh
GENERATE_CLONE=0
if [ "$1" == "-g" ]
then
    GENERATE_CLONE=1
fi

if [ $GENERATE_CLONE == 1 ]
then
    file="clone.sh"

    if [ -f $file ] ; 
    then
        rm $file
    fi
    touch $file
    chmod +x $file
fi

total=$(ls -l | grep -c ^d)
curr=1
bold=$(tput bold)
normal=$(tput sgr0)

for d in */ ; do
    cd $d
    url=$(git config --get remote.origin.url)
    if [[ ! -z $url ]] && [[ $url != *"Sunakarus/dotfiles"* ]]
    then
        echo "[$curr/$total] ${bold}$url${normal}"
        if [ $GENERATE_CLONE == 1 ]
        then
            echo "git clone $url" >> ../$file
        fi
        git pull
    else
        echo "[$curr/$total] Not a git repository, skipping..."
    fi
    curr=$[$curr+1]
    cd ..
done

if [ $GENERATE_CLONE == 1 ]
then
    echo "Clone file generated in ./$file"
fi
