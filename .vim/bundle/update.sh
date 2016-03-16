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
    echo "[$curr/$total] $(git config --get remote.origin.url)"
    echo "git clone $(git config --get remote.origin.url)" >> ../$file
    git pull
    curr=$[$curr+1]
    cd ..
done
