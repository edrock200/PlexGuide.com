#!/bin/bash
#
# Title:      PlexGuide (Reference Title File)
# Author(s):  Admin9705 - Deiteq
# URL:        https://plexguide.com - http://github.plexguide.com
# GNU:        General Public License v3.0
################################################################################
menu=$(cat /pg/var/final.choice)

if [ "$menu" == "2" ]; then
  echo ""
  echo "-----------------------------------------------------"
  echo "SYSTEM MESSAGE: Please Read the Following Information"
  echo "-----------------------------------------------------"
  echo ""
  echo "NOTE: Setting the Server ID enables the Server to have"
  echo "a unique name for backup and setup purposes."
  echo ""
  echo "Remember KISS: Keep-It-Simple Stupid! Create a simple"
  echo "one word server ID such as hetzner1 or myserver"
  echo ""
  read -n 1 -s -r -p "Press [ANY KEY] to Continue"
  echo ""
  echo ""
  read -p "Set or Change the Server ID (y/n)? " -n 1 -r
  echo    # move cursor to a new line
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    echo ""
    echo "---------------------------------------------------"
    echo "SYSTEM MESSAGE: [Y] Key was NOT Selected - Exiting!"
    echo "---------------------------------------------------"
    echo ""
    read -n 1 -s -r -p "Press [ANY KEY] to Continue "
      echo "";
      exit 1;
  fi

  break=no
  while [ "$break" == "no" ]; do
  echo ""
  read -p 'Type a Sever ID & Then Press [ENTER]: ' typed
  #typed=typed+0
    echo ""
    echo "-------------------------------------------------"
    echo "SYSTEM MESSAGE: Server ID - $typed"
    echo "-------------------------------------------------"
    echo ""
    read -p "Continue with the Set Server ID (y/n)? " -n 1 -r

    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
      echo ""
      echo "---------------------------------------------------"
      echo "SYSTEM MESSAGE: [Y] Key was NOT Selected"
      echo "---------------------------------------------------"
      echo ""
      echo "You will be able to set the Server ID Again!"
      echo
      read -n 1 -s -r -p "Press [ANY KEY] to Continue "
      echo "";
    else
      echo ""
      echo "---------------------------------------------------"
      echo "SYSTEM MESSAGE: Server ID - $typed"
      echo "---------------------------------------------------"
      echo ""
      echo "Your Server ID is Now Set! Thank you!"
      echo ""
      echo $typed > /pg/var/server.id
      break=yes
      read -n 1 -s -r -p "Press [ANY KEY] to Continue "
      echo "";
    fi
  done

#### Final fi
fi

idtest=$(cat /pg/var/server.id)
if [ "$idtest" == "NOT-SET" ]; then
  echo ""
  echo "---------------------------------------------------"
  echo "SYSTEM MESSAGE: You Must Create a SERVER ID!"
  echo "---------------------------------------------------"
  echo ""
  echo "Restarting the Process"
  echo
  read -n 1 -s -r -p "Press [ANY KEY] to Continue "
  echo serverid > /pg/var/type.choice && bash /pg/pgblitz/menu/core/scripts/main.sh
  exit
fi
