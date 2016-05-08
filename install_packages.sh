#!/bin/bash

# Make sure only root can run our script (http://www.cyberciti.biz/tips/shell-root-user-check-script.html)
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root!" 1>&2
   echo "This script must be run as root!" > output.log
   exit 1
fi

# Set wallpaper
gsettings set org.gnome.desktop.background picture-uri file:////home/grehg/Git/DebainBasedCustomizer/lannister_wallpaper.jpg # (http://askubuntu.com/questions/156713/change-desktop-background-from-terminal)
echo "Set wallpaper" > output.log

# Update the system
apt-get  update
apt-get -y upgrade
apt-get -y dist-upgrade 
apt-get install -y guake vim chromium-browser virtualbox filezilla vlc gparted git conky cowsay nethack-console gimp deluge g++ make

echo "Regarding deluge and torguard, don't forget to set up deluge to use torguard as a proxy. There's a guide here https://torguard.net/knowledgebase.php?action=displayarticle&id=40" >> output.log


echo "Regarding virtualbox, don't forget to install guest additions in the guest OS guide here http://askubuntu.com/questions/22743/how-do-i-install-guest-additions-in-a-virtualbox-vm" >> output.log
echo "and extension pack here https://www.virtualbox.org/wiki/Downloads" >> output.log

# Make guake run on boot
ln -s /usr/share/applications/guake.desktop /etc/xdg/autostart/ # (http://askubuntu.com/questions/368705/how-to-make-guake-start-at-login)
echo "Regarding guake, run guake and uncheck Enable notifications on startup " >> output.log

# Make conky run on boot
cp conky.desktop /usr/share/applications/
ln -s /usr/share/applications/conky.desktop /etc/xdg/autostart/ # (https://forums.linuxmint.com/viewtopic.php?t=101506)

#Configure git
git config --global user.email "Gregory.Hilston@gmail.com"
git config --global user.name "GregHilston"

# Install Cinnamon, Java 8, Sublime Text 3, Pidgin and Skype
add-apt-repository -y ppa:lestcape/cinnamon 												# Install cinnamon 		 (http://www.webupd8.org/2014/12/install-cinnamon-24-stable-in-ubuntu.html)
add-apt-repository -y ppa:webupd8team/java 										# Install java 8  		 (http://askubuntu.com/questions/634082/how-to-install-android-studio-on-ubuntu)
add-apt-repository -y ppa:webupd8team/sublime-text-3 								 	# Install sublime-text-3 (http://askubuntu.com/questions/172698/how-do-i-install-sublime-text-2-3)
add-apt-repository -y ppa:pidgin-developers/ppa 									# Install pidgin 		 (http://askubuntu.com/questions/307622/update-pidgin-using-apt-get)
add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner" 		# Install skype 		 (http://askubuntu.com/questions/293693/how-to-install-skype-with-ubuntu-13-04)#
apt-get update
apt-get install -y cinnamon oracle-java8-installer oracle-java8-set-default sublime-text-installer pidgin skype

# Alternative Hackish way to install Java 8 
# Install Oracle's JDK 8 (http://askubuntu.com/questions/272314/setup-and-install-intellij-with-jdk)
# echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections &&
# update-java-alternatives -s java-8-oracle &&

# Install Google Music
cd /tmp/
wget https://github-cloud.s3.amazonaws.com/releases/40008106/9036d91e-e790-11e5-81fe-0fec2ae693c9.deb?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAISTNZFOVBIJMK3TQ%2F20160326%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20160326T231505Z&X-Amz-Expires=300&X-Amz-Signature=a0062299cc92051bd571e5c52ed9728115b1602166d3e4718eff16946fc4de6c&X-Amz-SignedHeaders=host&actor_id=4227776&response-content-disposition=attachment%3B%20filename%3Dgoogle-play-music-desktop-player_3.0.1_amd64.deb&response-content-type=application%2Foctet-stream
dpkg -i google-play-music-desktop-player_3.0.1_amd64.deb

# Install Facebook Messenger Desktop
cd /tmp/ 
wget https://github.com/Aluxian/Facebook-Messenger-Desktop/releases/download/v1.4.3/Messenger_linux64.deb
dkpg -i Messenger_linux64.deb

# Install Intellij
cd /opt/
mkdir idea
cd /opt/idea
wget -O https://d1opms6zj7jotq.cloudfront.net/idea/ideaIU-2016.1.1.tar.gz # Old URL /tmp/intellij.tar.gz https://download.jetbrains.com/idea/ideaIU-2016.1.tar.gz
tar xfz /tmp/intellij.tar.gz 

# Install PyCharm
cd /opt/idea/
wget -O https://d1opms6zj7jotq.cloudfront.net/python/pycharm-professional-2016.1.2.tar.gz # Old URL /tmp/pycharm.tar.gz https://download.jetbrains.com/python/pycharm-professional-2016.1.tar.gz
tar xfz /tmp/pycharm.tar.gz 

# Install Clion
wget -O https://d1opms6zj7jotq.cloudfront.net/cpp/CLion-2016.1.1.tar.gz # Old URL /tmp/clion.tar.gz https://download.jetbrains.com/cpp/CLion-2016.1.tar.gz
tar xfz /tmp/clion.tar.gz 

# Install Android Studio (http://askubuntu.com/questions/634082/how-to-install-android-studio-on-ubuntu)
cd /tmp/
wget https://dl.google.com/dl/android/studio/ide-zips/1.5.1.0/android-studio-ide-141.2456560-linux.zip
unzip android-studio-ide-141.2456560-linux.zip -d /opt/
