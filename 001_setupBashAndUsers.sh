#!/bin/bash
# exit script if error
set -e

# Install nano
echo "*** Do you wish to install nano? ***"
select yn in "Yes" "No"
do
  case $yn in
    Yes )
      yum -y install nano 1 > /dev/null;
      break;
      ;;
    No ) break;;
  esac
done

# Create admin account
echo "*** Enter username for admin account ***"
read username;
useradd -m $username;
passwd $username;
echo $username' ALL=(ALL:ALL) ALL' >> /etc/sudoers;
chsh -s /bin/bash $username;

# Add additional user accounts
echo "*** Do you wish to create additional users? ***"
select yn in "Yes" "No"
do
  case $yn in
    Yes )
  	 echo "*** Enter username ***"
     read username;
     useradd -m $username;
     passwd $username;
     echo $username' ALL=(ALL:ALL) ALL' >> /etc/sudoers;
     chsh -s /bin/bash $username;
     break;
     ;;
    No ) break;;
  esac
done

# Make Bash pretty
echo "*** Making bash pretty ***"
mv /etc/bashrc /etc/bashrc.bak
cp ./001a_bashrc.sh /etc/bashrc

mv /etc/DIR_COLORS /etc/DIR_COLORS.bak
cp ./001a_DIR_COLORS.sh /etc/DIR_COLORS
