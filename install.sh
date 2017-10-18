#!/bin/bash
# simple symbolic link script.
cd $(dirname $0)
p=`pwd`
touch $p/aliases
for i in $( ls $p | grep -v $0 ); do
  case $i in
    "Dockerfile") ;;
    "install.sh") ;;
    "Makefile") ;;
    "nfs") ;;
    "shellinabox.css") ;;
    "supervisord.conf") ;;
    *) 
      if [ -f ~/.$i ];then
        /bin/mv ~/.$i ~/.$i-$(date +"%s")
        /bin/ln -s $p/$i ~/.$i
      else
        /bin/ln -s $p/$i ~/.$i
      fi
      if [[ -d ~/.$i/ && ! -L ~/.$i ]];then
        /bin/mv ~/.$i/ ~/.$i-$(date +"%s")/
        /bin/ln -s $p/$i ~/.$i
      fi
      #/bin/rm -rf ~/.$i 
    ;;
  esac
done
# .authorized_keys >> ~/.ssh/authorized_keys
