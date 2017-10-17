#!/bin/bash
# simple symbolic link script.
cd $(dirname $0)
p=`pwd`
touch $p/aliases
for i in $( ls $p | grep -v $0 ); do
  case $i in
    "Dockerfile") ;;
    "Makefile") ;;
    "supervisord.conf") ;;
    *) 
      if [ -f ~/.$i ];then
        /bin/mv ~/.$i ~/.$i-$(date +"%s")
      fi
      if [ -d ~/.$i/ ];then
        /bin/mv ~/.$i/ ~/.$i-$(date +"%s")/
      fi
      #/bin/rm -rf ~/.$i 
      /bin/ln -s $p/$i ~/.$i
    ;;
  esac
done
# .authorized_keys >> ~/.ssh/authorized_keys
