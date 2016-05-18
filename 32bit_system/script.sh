clear
echo "###############################################################"
echo "###############################################################"
echo "########### Welcome to ubuntu Automatic installer #############"
echo "###########       ADITYA NEHRA (M150102CS)        #############"
echo "###########      Anoop Chaudhary (M150121CS)      #############"
echo "###############################################################"
echo "###############################################################\n"

echo "Please choose ubuntu version-- \n"
echo " press 1 for ubuntu 12.04 Desktop"
echo " press 2 for ubuntu 12.04 server"
echo " press 3 for ubuntu 14.04 Desktop"
echo " press 4 for ubuntu 14.04 server"
echo " press 5 for ubuntu 15.10 Desktop"
echo " press 6 for ubuntu 15.10 server\n"
printf "Enter your choice ::: "
read choice
case $choice in 
	1 ) 
		echo "###############################################################"
		echo "###############################################################"
		echo "#############  U choose ubuntu in 12.04 Desktop  ##############"
		echo "###############################################################"
		echo "###############################################################"
		echo "Enter the iso location"		
		read loc
		if [ -f "$loc" ]
		then
			if [ $(echo "$loc" | grep ".iso" ) ] 
			then
				echo "ya"
				cp $(echo $loc) ./ubuntu12.iso
				mkdir iso
				sudo mount -o loop ubuntu12.iso ./iso
				rsync -avr ./iso/ ./extract/
				sudo chmod 777 -R extract
				sudo umount ./iso
				sudo rm -R ./iso
				rm ./extract/isolinux/isolinux.cfg				
				rm ./extract/isolinux/txt.cfg
				rm ./extract/isolinux/langlist
				rm ./extract/preseed/ubuntu.seed
				cp ./files/12/isolinux.cfg ./extract/isolinux/isolinux.cfg
				cp ./files/12/txt.cfg ./extract/isolinux/txt.cfg
				#cp ./files/15/langlist ./extract/isolinux/langlist
				echo "###############################################################"
				echo "###############################################################"
				echo "########## Choose a language for installation purpose #########"
				echo "###############################################################"
				echo "###############################################################"
				echo "press 1 for arabic"
				echo "press 2 for belarusia"
				echo "press 3 for bosnian"
				echo "press 4 for chinese"
				echo "press 5 for czech"
				echo "press 6 for danish"
				echo "press 7 for english"
				echo "press 8 for english_us"
				echo "press 9 for french"
				echo "press 10 for german"
				#echo "press 11 for geek"
				echo "press 12 for hebrew"
				echo "press 13 for hindi"
				#echo "press 14 for arabic"
				echo "press 14 for japanese"
				#echo "press 15 for arabic"
				echo "press 15 for kannada"
				#echo "press 18 for arabic"
				echo "press 16 for malayalam"
				#echo "press 17 for arabic"
				echo "press 17 for portugese"
				echo "press 18 for russian"
				echo "press 19 for tamil"
				language="en_US.UTF-8"
				read lang
				case $lang in 
					1 )
						language="af_ZA.UTF-8";;
					2 )
						language="be_BY.UTF-8";;
					3 )
						language="bs_BA.UTF-8";;
					4 )
						language="zh_CN.UTF-8";; 
					5 )
						language="cs_CZ.UTF-8";;
					6 )
						language="da_DK.UTF-8";;
					7 )
						language="en_US.UTF-8";;
					8 )
						language="en.UTF-8";;
					9 )
						language="fr_FR.UTF-8";;
					10 )
						language="de_DE.UTF-8";;
					12 )
						language="he_IL.UTF-8";;
					13 )
						language="hi_IN.UTF-8"
						
						;;
					14 )
						language="ja_JP.UTF-8";;
					15 )
						language="kn_IN.UTF-8";;
					16 )
						language="ml_IN.UTF-8";;
					17 )
						language="pt_PT.UTF-8";;
					18 )
						language="ru_RU.UTF-8";;
					19 )
						language="ta_IN.UTF-8";;
					* )
						;;
				esac
				echo $language >> ./extract/isolinux/langlist
				echo "#########################################################"
				echo "#########################################################"
				printf " Enter the user-fullname::: "
				read fullname
				printf "\n Enter the username:::::::: "
				read username
				printf "\n Enter the password:::::::: "
				read password1
				printf "\n Enter the password again:: "
				read password2
				echo "######################################################################
################## preseed by aditya (M150102CS) #####################
######################################################################
\n# General
\n####################################################################
\n
\n# Once installation is complete, automatically power off.
\n# d-i finish-install/reboot_in_progress note
\nd-i debian-installer/exit/poweroff boolean true
\nd-i ubiquity/summary note
\nubiquity ubiquity/reboot boolean true
\nubiquity ubiquity/poweroff boolean true
\n
\n# Automatically download and install stable updates?
\nunattended-upgrades unattended-upgrades/enable_auto_updates boolean true
\n
\n
\n####################################################################
\n# Networking
\n####################################################################
\n# Network Configuration
\nd-i netcfg/enable boolean true
\nd-i netcfg/choose_interface select auto
\nd-i netcfg/disable_dhcp boolean false
\n
\n
\n####################################################################
\n# Disk Partitioning / Boot loader
\n####################################################################
\n
\n### Disk Partitioning ###
\n
\n# Configure auto partitioner
\nubiquity partman-auto/init_automatically_partition select Guided - use entire disk
\nubiquity partman-auto/disk string /dev/sda
\nubiquity partman-auto/method string regular
\nubiquity partman-auto/choose_recipe select All files in one partition (recommended for new users)
\nubiquity partman/confirm_write_new_label boolean true
\nubiquity partman/choose_partition select Finish partitioning and write changes to disk
\nubiquity partman/confirm boolean  true
\n
\n# If one of the disks that are going to be automatically partitioned
\n# contains an old LVM configuration, the user will normally receive a
\n# warning. This can be preseeded away...
\nd-i partman-lvm/device_remove_lvm boolean true
\n# The same applies to pre-existing software RAID array:
\nd-i partman-md/device_remove_md boolean true
\n# And the same goes for the confirmation to write the lvm partitions.
\nd-i partman-lvm/confirm boolean true

\nd-i partman-lvm/confirm boolean true
\nd-i partman/confirm_write_new_label boolean true
\nd-i partman/choose_partition select Finish partitioning and write changes to disk
\nd-i partman/confirm boolean true
\n# This makes partman automatically partition without confirmation.
\nd-i partman-md/confirm boolean true
\nd-i partman-partitioning/confirm_write_new_label boolean true
\nd-i partman/choose_partition select finish
\nd-i partman/confirm boolean true
\nd-i partman/confirm_nooverwrite boolean true

\n
\n####################################################################
\n# Localizations / Timezone
\n####################################################################
\n
\n### Keyboard selection ###
\nd-i keyboard-configuration/layoutcode string us
\nd-i keyboard-configuration/variantcode string
\n
\n### Locale ###
\nd-i debian-installer/locale string $language
\n
\n### Timezone ###
\nd-i time/zone select Europe/Amsterdam
\nd-i clock-setup/utc boolean true
\nd-i clock-setup/ntp boolean false
\nd-i console-setup/ask_detect boolean false
\nd-i console-setup/layoutcode string us
\n
\nd-i localechooser/supported-locales multiselect nl_NL, nl_BE, fr_BE
\n
\n
\n
\n####################################################################
\n# User Creation
\n####################################################################
\n
\n# Root User
\nd-i passwd/root-login boolean false
\n
\n# Mortal User
\nd-i passwd/user-fullname string $fullname
\nd-i passwd/username string $username
\nd-i passwd/user-password password $password1
\nd-i passwd/user-password-again password $password2
\nd-i passwd/auto-login boolean true
\nd-i user-setup/allow-password-weak boolean true
\n
\n
\n####################################################################
\n# Some extras
\n####################################################################
\ntasksel tasksel/first multiselect ubuntu-desktop
\nd-i pkgsel/include string build-essential isomaster uck clamav clamtk openconnect adobe-flashplugin vmware-view-client
\n
\n# installing languages
\n# Language pack selection
\nd-i pkgsel/language-packs multiselect nl, fr, en
\n
\n# Whether to upgrade packages after debootstrap.
\n# Allowed values: none, safe-upgrade, full-upgrade
\nd-i pkgsel/upgrade select none
\n
\n# Policy for applying updates. May be \"none\" (no automatic updates),
\n#d-i pkgsel/update-policy select unattended-upgrades
\n
\n# By default, the system's locate database will be updated after the
\n# installer has finished installing most packages. This may take a while, so
\n# if you don't want it, you can set this to \"false\" to turn it off.
\n#d-i pkgsel/updatedb boolean true
\n
\n# This command is run just before the install finishes, but when there is
\n# still a usable /target directory. You can chroot to /target and use it
\n# directly, or use the apt-install and in-target commands to easily install
\n# packages and run commands in the target system.
\n#d-i preseed/late_command string apt-install zsh; in-target chsh -s /bin/zsh
\n
\n# And now we REALLY run with it!!
\nd-i preseed/late_command string \
\nin-target apt-get remove unity-scope-imdb unity-scope-musicstores unity-scope-zotero unity-scope-click-autopilot \
\nin-target apt-get remove unity-scope-deviantart unity-scope-gallica unity-scope-gdocs unity-scope-github unity-scope-googlenews \
\nin-target apt-get remove unity-scope-launchpad unity-scope-mediascanner unity-scope-onlinemusic unity-scope-openweathermap \
\nin-target apt-get remove unity-scope-soundcloud unity-scope-sshsearch unity-scope-yahoostock unity-lens-photos unity-lens-video \
\nin-target apt-get remove unity-scope-audacious unity-scope-chromiumbookmarks unity-scope-clementine unity-scope-click unity-scope-colourlovers \
\nin-target apt-get remove unity-scope-gdrive unity-scope-gmusicbrowser unity-scope-gourmet unity-scope-guayadeque unity-scope-mediascanner2 \
\nin-target apt-get remove unity-scope-musique unity-scope-openclipart unity-scope-texdoc unity-scope-tomboy unity-scope-video-remote \
\nin-target apt-get remove unity-scope-virtualbox unity-scope-yelp unity-webapps-service account-plugin-ubuntuone ubuntu-purchase-service \
\n
\nin-target cp /cdrom/preseed/install.sh . ;\
\nin-target chmod +x install.sh ;\
\nin-target cp /cdrom/preseed/vpn.zip . ;\
\nin-target unzip vpn.zip ;\
\nin-target chmod +x vpn/vpn_install.sh ;\
\nin-target sh vpn/vpn_install.sh ;\
\nin-target sh install.sh ;\
\nin-target rm install.sh"	>> ./extract/preseed/ubuntu.seed
				##########cp ./files/15/u_preseed ./extract/preseed/ubuntu.seed
				sudo mkisofs -r -V "output.iso" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o output.iso ./extract
				sudo chmod 777 output.iso
				rm -R extract
				rm ubuntu12.iso
				
			else 
				echo "not a valid iso file "
			fi
				
		else 
			echo "not a file"
		fi
		;;
	#############
	#############
	#############

		
	2 ) 
		echo "you enter 2"
		echo "###############################################################"
		echo "###############################################################"
		echo "#############  U choose ubuntu in 12.04 Server   ##############"
		echo "###############################################################"
		echo "###############################################################"
		echo "Enter the iso location"		
		read loc
		if [ -f "$loc" ]
		then
			if [ $(echo "$loc" | grep ".iso" ) ] 
			then
				echo "ya"
				cp $(echo $loc) ./ubuntu12.iso
				mkdir iso
				sudo mount -o loop ubuntu12.iso ./iso
				rsync -avr ./iso/ ./extract/
				sudo chmod 777 -R extract
				sudo umount ./iso
				sudo rm -R ./iso
				rm ./extract/isolinux/isolinux.cfg				
				rm ./extract/isolinux/txt.cfg
				rm ./extract/isolinux/langlist
				rm ./extract/preseed/ubuntu-server.seed
				cp ./files/12ser/isolinux.cfg ./extract/isolinux/isolinux.cfg
				#cp ./files/12ser/txt.cfg ./extract/isolinux/txt.cfg
				#cp ./files/15/langlist ./extract/isolinux/langlist
				echo "###############################################################"
				echo "###############################################################"
				echo "########## Choose a language for installation purpose #########"
				echo "###############################################################"
				echo "###############################################################"
				echo "press 1 for arabic"
				echo "press 2 for belarusia"
				echo "press 3 for bosnian"
				echo "press 4 for chinese"
				echo "press 5 for czech"
				echo "press 6 for danish"
				echo "press 7 for english"
				echo "press 8 for english_us"
				echo "press 9 for french"
				echo "press 10 for german"
				#echo "press 11 for geek"
				echo "press 12 for hebrew"
				echo "press 13 for hindi"
				#echo "press 14 for arabic"
				echo "press 14 for japanese"
				#echo "press 15 for arabic"
				echo "press 15 for kannada"
				#echo "press 18 for arabic"
				echo "press 16 for malayalam"
				#echo "press 17 for arabic"
				echo "press 17 for portugese"
				echo "press 18 for russian"
				echo "press 19 for tamil"
				language="en_US.UTF-8"
				read lang
				case $lang in 
					1 )
						language="af_ZA.UTF-8";;
					2 )
						language="be_BY.UTF-8";;
					3 )
						language="bs_BA.UTF-8";;
					4 )
						language="zh_CN.UTF-8";; 
					5 )
						language="cs_CZ.UTF-8";;
					6 )
						language="da_DK.UTF-8";;
					7 )
						language="en_US.UTF-8";;
					8 )
						language="en.UTF-8";;
					9 )
						language="fr_FR.UTF-8";;
					10 )
						language="de_DE.UTF-8";;
					12 )
						language="he_IL.UTF-8";;
					13 )
						language="hi_IN.UTF-8"
						
						;;
					14 )
						language="ja_JP.UTF-8";;
					15 )
						language="kn_IN.UTF-8";;
					16 )
						language="ml_IN.UTF-8";;
					17 )
						language="pt_PT.UTF-8";;
					18 )
						language="ru_RU.UTF-8";;
					19 )
						language="ta_IN.UTF-8";;
					* )
						;;
				esac
				echo $language >> ./extract/isolinux/langlist
				txt="default install
\nlabel install
\n  menu label ^Install Ubuntu Server
\n  kernel /install/vmlinuz
\n  append locale=$language keyboard-configuration/layoutcode=us file=/cdrom/preseed/ubuntu-server.seed vga=788 initrd=/install/initrd.gz quiet --
"
				echo $txt > ./extract/isolinux/txt.cfg
				echo "#########################################################"
				echo "#########################################################"
				printf " Enter the user-fullname::: "
				read fullname
				printf "\n Enter the username:::::::: "
				read username
				printf "\n Enter the password:::::::: "
				read password1
				printf "\n Enter the password again:: "
				read password2
				printf "\n Enter the hostname::::::::"
				read hostname
				echo "######################################################################
################## preseed by aditya (M150102CS) #####################
######################################################################
\n# General
\n####################################################################
## Options to set on the command line
\nd-i debian-installer/locale string $language
\nd-i console-setup/ask_detect boolean false
\nd-i console-setup/layout string us
\n
\nd-i netcfg/enable boolean false
\nd-i netcfg/get_hostname string $hostname
\nd-i netcfg/get_domain string unassigned-domain
\n
\nd-i time/zone string UTC
\nd-i clock-setup/utc-auto boolean true
\nd-i clock-setup/utc boolean true
\n
\nd-i kbd-chooser/method select American English
\n
\nd-i netcfg/wireless_wep string
\n
\nd-i base-installer/kernel/override-image string linux-server
\n
\nd-i debconf debconf/frontend select Noninteractive
\n
\nd-i pkgsel/install-language-support boolean false
\ntasksel tasksel/first multiselect standard, ubuntu-server
\n
\nd-i partman-auto/method string lvm
\n
\nd-i partman-lvm/confirm boolean true
\nd-i partman-lvm/device_remove_lvm boolean true
\nd-i partman-auto/choose_recipe select atomic
\n
\nd-i partman/confirm_write_new_label boolean true
\nd-i partman/confirm_nooverwrite boolean true
\nd-i partman/choose_partition select finish
\nd-i partman/confirm boolean true
\n
\n# Write the changes to disks and configure LVM?
\nd-i partman-lvm/confirm boolean true
\nd-i partman-lvm/confirm_nooverwrite boolean true
\nd-i partman-auto-lvm/guided_size string max
\n
\n### Keyboard selection ###
\nd-i keyboard-configuration/layoutcode string us
\nd-i keyboard-configuration/variantcode string
\n
\n### Locale ###
\nd-i debian-installer/locale string en_US
\n
\n
\n# Default user
\nd-i passwd/user-fullname string $fullname
\nd-i passwd/username string $username
\nd-i passwd/user-password password $password1
\nd-i passwd/user-password-again password $password2
\nd-i user-setup/encrypt-home boolean false
\nd-i user-setup/allow-password-weak boolean true
\n
\n# Minimum packages (see postinstall.sh)
\nd-i pkgsel/include string openssh-server ntp
\n
\n# Upgrade packages after debootstrap? (none, safe-upgrade, full-upgrade)
\n# (note: set to none for speed)
\nd-i pkgsel/upgrade select none
\n
\nd-i grub-installer/only_debian boolean true
\nd-i grub-installer/with_other_os boolean true
\nd-i finish-install/reboot_in_progress note
\n
\nd-i pkgsel/update-policy select none
\n
\nchoose-mirror-bin mirror/http/proxy string
\n"	>> ./extract/preseed/ubuntu-server.seed
				##########cp ./files/15/u_preseed ./extract/preseed/ubuntu.seed
				sudo mkisofs -r -V "output.iso" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o output.iso ./extract
				sudo chmod 777 output.iso
				rm -R extract
				rm ubuntu12.iso
				
			else 
				echo "not a valid iso file "
			fi
				
		else 
			echo "not a file"
		fi
		;;
	###########
	#########
	##########
	3)
		echo "###############################################################"
		echo "###############################################################"
		echo "#############  U choose ubuntu in 14.10 Desktop  ##############"
		echo "###############################################################"
		echo "###############################################################"
		echo "Enter the iso location"		
		read loc
		if [ -f "$loc" ]
		then
			if [ $(echo "$loc" | grep ".iso" ) ] 
			then
				echo "ya"
				cp $(echo $loc) ./ubuntu14.iso
				mkdir iso
				sudo mount -o loop ubuntu14.iso ./iso
				rsync -avr ./iso/ ./extract/
				sudo chmod 777 -R extract
				sudo umount ./iso
				sudo rm -R ./iso
				rm ./extract/isolinux/isolinux.cfg				
				rm ./extract/isolinux/txt.cfg
				rm ./extract/isolinux/langlist
				rm ./extract/preseed/ubuntu.seed
				cp ./files/14/isolinux.cfg ./extract/isolinux/isolinux.cfg
				cp ./files/14/txt.cfg ./extract/isolinux/txt.cfg
				#cp ./files/15/langlist ./extract/isolinux/langlist
				echo "###############################################################"
				echo "###############################################################"
				echo "########## Choose a language for installation purpose #########"
				echo "###############################################################"
				echo "###############################################################"
				echo "press 1 for arabic"
				echo "press 2 for belarusia"
				echo "press 3 for bosnian"
				echo "press 4 for chinese"
				echo "press 5 for czech"
				echo "press 6 for danish"
				echo "press 7 for english"
				echo "press 8 for english_us"
				echo "press 9 for french"
				echo "press 10 for german"
				#echo "press 11 for geek"
				echo "press 12 for hebrew"
				echo "press 13 for hindi"
				#echo "press 14 for arabic"
				echo "press 14 for japanese"
				#echo "press 15 for arabic"
				echo "press 15 for kannada"
				#echo "press 18 for arabic"
				echo "press 16 for malayalam"
				#echo "press 17 for arabic"
				echo "press 17 for portugese"
				echo "press 18 for russian"
				echo "press 19 for tamil"
				language="en_US.UTF-8"
				read lang
				case $lang in 
					1 )
						language="af_ZA.UTF-8";;
					2 )
						language="be_BY.UTF-8";;
					3 )
						language="bs_BA.UTF-8";;
					4 )
						language="zh_CN.UTF-8";; 
					5 )
						language="cs_CZ.UTF-8";;
					6 )
						language="da_DK.UTF-8";;
					7 )
						language="en_US.UTF-8";;
					8 )
						language="en.UTF-8";;
					9 )
						language="fr_FR.UTF-8";;
					10 )
						language="de_DE.UTF-8";;
					12 )
						language="he_IL.UTF-8";;
					13 )
						language="hi_IN.UTF-8"
						
						;;
					14 )
						language="ja_JP.UTF-8";;
					15 )
						language="kn_IN.UTF-8";;
					16 )
						language="ml_IN.UTF-8";;
					17 )
						language="pt_PT.UTF-8";;
					18 )
						language="ru_RU.UTF-8";;
					19 )
						language="ta_IN.UTF-8";;
					* )
						;;
				esac
				echo $language >> ./extract/isolinux/langlist
				echo "#########################################################"
				echo "#########################################################"
				printf " Enter the user-fullname::: "
				read fullname
				printf "\n Enter the username:::::::: "
				read username
				printf "\n Enter the password:::::::: "
				read password1
				printf "\n Enter the password again:: "
				read password2
				echo "######################################################################
################## preseed by aditya (M150102CS) #####################
######################################################################
\n# General
\n####################################################################
\n
\n# Once installation is complete, automatically power off.
\n# d-i finish-install/reboot_in_progress note
\nd-i debian-installer/exit/poweroff boolean true
\nd-i ubiquity/summary note
\nubiquity ubiquity/reboot boolean true
\nubiquity ubiquity/poweroff boolean true
\n
\n# Automatically download and install stable updates?
\nunattended-upgrades unattended-upgrades/enable_auto_updates boolean true
\n
\n
\n####################################################################
\n# Networking
\n####################################################################
\n# Network Configuration
\nd-i netcfg/enable boolean true
\nd-i netcfg/choose_interface select auto
\nd-i netcfg/disable_dhcp boolean false
\n
\n
\n####################################################################
\n# Disk Partitioning / Boot loader
\n####################################################################
\n
\n### Disk Partitioning ###
\n
\n# Configure auto partitioner
\nubiquity partman-auto/init_automatically_partition select Guided - use entire disk
\nubiquity partman-auto/disk string /dev/sda
\nubiquity partman-auto/method string regular
\nubiquity partman-auto/choose_recipe select All files in one partition (recommended for new users)
\nubiquity partman/confirm_write_new_label boolean true
\nubiquity partman/choose_partition select Finish partitioning and write changes to disk
\nubiquity partman/confirm boolean  true
\n
\n# If one of the disks that are going to be automatically partitioned
\n# contains an old LVM configuration, the user will normally receive a
\n# warning. This can be preseeded away...
\nd-i partman-lvm/device_remove_lvm boolean true
\n# The same applies to pre-existing software RAID array:
\nd-i partman-md/device_remove_md boolean true
\n# And the same goes for the confirmation to write the lvm partitions.
\nd-i partman-lvm/confirm boolean true

\nd-i partman-lvm/confirm boolean true
\nd-i partman/confirm_write_new_label boolean true
\nd-i partman/choose_partition select Finish partitioning and write changes to disk
\nd-i partman/confirm boolean true
\n# This makes partman automatically partition without confirmation.
\nd-i partman-md/confirm boolean true
\nd-i partman-partitioning/confirm_write_new_label boolean true
\nd-i partman/choose_partition select finish
\nd-i partman/confirm boolean true
\nd-i partman/confirm_nooverwrite boolean true

\n
\n####################################################################
\n# Localizations / Timezone
\n####################################################################
\n
\n### Keyboard selection ###
\nd-i keyboard-configuration/layoutcode string us
\nd-i keyboard-configuration/variantcode string
\n
\n### Locale ###
\nd-i debian-installer/locale string $language
\n
\n### Timezone ###
\nd-i time/zone select Europe/Amsterdam
\nd-i clock-setup/utc boolean true
\nd-i clock-setup/ntp boolean false
\nd-i console-setup/ask_detect boolean false
\nd-i console-setup/layoutcode string us
\n
\nd-i localechooser/supported-locales multiselect nl_NL, nl_BE, fr_BE
\n
\n
\n
\n####################################################################
\n# User Creation
\n####################################################################
\n
\n# Root User
\nd-i passwd/root-login boolean false
\n
\n# Mortal User
\nd-i passwd/user-fullname string $fullname
\nd-i passwd/username string $username
\nd-i passwd/user-password password $password1
\nd-i passwd/user-password-again password $password2
\nd-i passwd/auto-login boolean true
\nd-i user-setup/allow-password-weak boolean true
\n
\n
\n####################################################################
\n# Some extras
\n####################################################################
\ntasksel tasksel/first multiselect ubuntu-desktop
\nd-i pkgsel/include string build-essential isomaster uck clamav clamtk openconnect adobe-flashplugin vmware-view-client
\n
\n# installing languages
\n# Language pack selection
\nd-i pkgsel/language-packs multiselect nl, fr, en
\n
\n# Whether to upgrade packages after debootstrap.
\n# Allowed values: none, safe-upgrade, full-upgrade
\nd-i pkgsel/upgrade select none
\n
\n# Policy for applying updates. May be \"none\" (no automatic updates),
\n#d-i pkgsel/update-policy select unattended-upgrades
\n
\n# By default, the system's locate database will be updated after the
\n# installer has finished installing most packages. This may take a while, so
\n# if you don't want it, you can set this to \"false\" to turn it off.
\n#d-i pkgsel/updatedb boolean true
\n
\n# This command is run just before the install finishes, but when there is
\n# still a usable /target directory. You can chroot to /target and use it
\n# directly, or use the apt-install and in-target commands to easily install
\n# packages and run commands in the target system.
\n#d-i preseed/late_command string apt-install zsh; in-target chsh -s /bin/zsh
\n
\n# And now we REALLY run with it!!
\nd-i preseed/late_command string \
\nin-target apt-get remove unity-scope-imdb unity-scope-musicstores unity-scope-zotero unity-scope-click-autopilot \
\nin-target apt-get remove unity-scope-deviantart unity-scope-gallica unity-scope-gdocs unity-scope-github unity-scope-googlenews \
\nin-target apt-get remove unity-scope-launchpad unity-scope-mediascanner unity-scope-onlinemusic unity-scope-openweathermap \
\nin-target apt-get remove unity-scope-soundcloud unity-scope-sshsearch unity-scope-yahoostock unity-lens-photos unity-lens-video \
\nin-target apt-get remove unity-scope-audacious unity-scope-chromiumbookmarks unity-scope-clementine unity-scope-click unity-scope-colourlovers \
\nin-target apt-get remove unity-scope-gdrive unity-scope-gmusicbrowser unity-scope-gourmet unity-scope-guayadeque unity-scope-mediascanner2 \
\nin-target apt-get remove unity-scope-musique unity-scope-openclipart unity-scope-texdoc unity-scope-tomboy unity-scope-video-remote \
\nin-target apt-get remove unity-scope-virtualbox unity-scope-yelp unity-webapps-service account-plugin-ubuntuone ubuntu-purchase-service \
\n
\nin-target cp /cdrom/preseed/install.sh . ;\
\nin-target chmod +x install.sh ;\
\nin-target cp /cdrom/preseed/vpn.zip . ;\
\nin-target unzip vpn.zip ;\
\nin-target chmod +x vpn/vpn_install.sh ;\
\nin-target sh vpn/vpn_install.sh ;\
\nin-target sh install.sh ;\
\nin-target rm install.sh"	>> ./extract/preseed/ubuntu.seed
				##########cp ./files/15/u_preseed ./extract/preseed/ubuntu.seed
				sudo mkisofs -r -V "output.iso" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o output.iso ./extract
				sudo chmod 777 output.iso
				rm -R extract
				rm ubuntu14.iso
				
			else 
				echo "not a valid iso file "
			fi
				
		else 
			echo "not a file"
		fi
		;;
	#############
	#############
	#############
	4) 
	echo "###############################################################"
		echo "###############################################################"
		echo "#############  U choose ubuntu in 14.04 Server   ##############"
		echo "###############################################################"
		echo "###############################################################"
		echo "Enter the iso location"		
		read loc
		if [ -f "$loc" ]
		then
			if [ $(echo "$loc" | grep ".iso" ) ] 
			then
				echo "ya"
				cp $(echo $loc) ./ubuntu14.iso
				mkdir iso
				sudo mount -o loop ubuntu14.iso ./iso
				rsync -avr ./iso/ ./extract/
				sudo chmod 777 -R extract
				sudo umount ./iso
				sudo rm -R ./iso
				rm ./extract/isolinux/isolinux.cfg				
				rm ./extract/isolinux/txt.cfg
				rm ./extract/isolinux/langlist
				rm ./extract/preseed/ubuntu-server.seed
				cp ./files/14ser/isolinux.cfg ./extract/isolinux/isolinux.cfg
				#cp ./files/14ser/txt.cfg ./extract/isolinux/txt.cfg
				#cp ./files/14/langlist ./extract/isolinux/langlist
				echo "###############################################################"
				echo "###############################################################"
				echo "########## Choose a language for installation purpose #########"
				echo "###############################################################"
				echo "###############################################################"
				echo "press 1 for arabic"
				echo "press 2 for belarusia"
				echo "press 3 for bosnian"
				echo "press 4 for chinese"
				echo "press 5 for czech"
				echo "press 6 for danish"
				echo "press 7 for english"
				echo "press 8 for english_us"
				echo "press 9 for french"
				echo "press 10 for german"
				#echo "press 11 for geek"
				echo "press 12 for hebrew"
				echo "press 13 for hindi"
				#echo "press 14 for arabic"
				echo "press 14 for japanese"
				#echo "press 15 for arabic"
				echo "press 15 for kannada"
				#echo "press 18 for arabic"
				echo "press 16 for malayalam"
				#echo "press 17 for arabic"
				echo "press 17 for portugese"
				echo "press 18 for russian"
				echo "press 19 for tamil"
				language="en_US.UTF-8"
				read lang
				case $lang in 
					1 )
						language="af_ZA.UTF-8";;
					2 )
						language="be_BY.UTF-8";;
					3 )
						language="bs_BA.UTF-8";;
					4 )
						language="zh_CN.UTF-8";; 
					5 )
						language="cs_CZ.UTF-8";;
					6 )
						language="da_DK.UTF-8";;
					7 )
						language="en_US.UTF-8";;
					8 )
						language="en.UTF-8";;
					9 )
						language="fr_FR.UTF-8";;
					10 )
						language="de_DE.UTF-8";;
					12 )
						language="he_IL.UTF-8";;
					13 )
						language="hi_IN.UTF-8"
						
						;;
					14 )
						language="ja_JP.UTF-8";;
					15 )
						language="kn_IN.UTF-8";;
					16 )
						language="ml_IN.UTF-8";;
					17 )
						language="pt_PT.UTF-8";;
					18 )
						language="ru_RU.UTF-8";;
					19 )
						language="ta_IN.UTF-8";;
					* )
						;;
				esac
				echo $language >> ./extract/isolinux/langlist
				txt="default install
\nlabel install
\n  menu label ^Install Ubuntu Server
\n  kernel /install/vmlinuz
\n  append locale=$language keyboard-configuration/layoutcode=us file=/cdrom/preseed/ubuntu-server.seed vga=788 initrd=/install/initrd.gz quiet --
"
				echo $txt > ./extract/isolinux/txt.cfg
				echo "#########################################################"
				echo "#########################################################"
				printf " Enter the user-fullname::: "
				read fullname
				printf "\n Enter the username:::::::: "
				read username
				printf "\n Enter the password:::::::: "
				read password1
				printf "\n Enter the password again:: "
				read password2
				printf "\n Enter the hostname::::::::"
				read hostname
				echo "######################################################################
################## preseed by aditya (M150102CS) #####################
######################################################################
\n# General
\n####################################################################
## Options to set on the command line
\nd-i debian-installer/locale string $language
\nd-i console-setup/ask_detect boolean false
\nd-i console-setup/layout string us
\n
\nd-i netcfg/enable boolean false
\nd-i netcfg/get_hostname string $hostname
\nd-i netcfg/get_domain string unassigned-domain
\n
\nd-i time/zone string UTC
\nd-i clock-setup/utc-auto boolean true
\nd-i clock-setup/utc boolean true
\n
\nd-i kbd-chooser/method select American English
\n
\nd-i netcfg/wireless_wep string
\n
\nd-i base-installer/kernel/override-image string linux-server
\n
\nd-i debconf debconf/frontend select Noninteractive
\n
\nd-i pkgsel/install-language-support boolean false
\ntasksel tasksel/first multiselect standard, ubuntu-server
\n
\nd-i partman-auto/method string lvm
\n
\nd-i partman-lvm/confirm boolean true
\nd-i partman-lvm/device_remove_lvm boolean true
\nd-i partman-auto/choose_recipe select atomic
\n
\nd-i partman/confirm_write_new_label boolean true
\nd-i partman/confirm_nooverwrite boolean true
\nd-i partman/choose_partition select finish
\nd-i partman/confirm boolean true
\n
\n# Write the changes to disks and configure LVM?
\nd-i partman-lvm/confirm boolean true
\nd-i partman-lvm/confirm_nooverwrite boolean true
\nd-i partman-auto-lvm/guided_size string max
\n
\n### Keyboard selection ###
\nd-i keyboard-configuration/layoutcode string us
\nd-i keyboard-configuration/variantcode string
\n
\n### Locale ###
\nd-i debian-installer/locale string en_US
\n
\n
\n# Default user
\nd-i passwd/user-fullname string $fullname
\nd-i passwd/username string $username
\nd-i passwd/user-password password $password1
\nd-i passwd/user-password-again password $password2
\nd-i user-setup/encrypt-home boolean false
\nd-i user-setup/allow-password-weak boolean true
\n
\n# Minimum packages (see postinstall.sh)
\nd-i pkgsel/include string openssh-server ntp
\n
\n# Upgrade packages after debootstrap? (none, safe-upgrade, full-upgrade)
\n# (note: set to none for speed)
\nd-i pkgsel/upgrade select none
\n
\nd-i grub-installer/only_debian boolean true
\nd-i grub-installer/with_other_os boolean true
\nd-i finish-install/reboot_in_progress note
\n
\nd-i pkgsel/update-policy select none
\n
\nchoose-mirror-bin mirror/http/proxy string
\n"	>> ./extract/preseed/ubuntu-server.seed
				##########cp ./files/15/u_preseed ./extract/preseed/ubuntu.seed
				sudo mkisofs -r -V "output.iso" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o output.iso ./extract
				sudo chmod 777 output.iso
				rm -R extract
				rm ubuntu14.iso
				
			else 
				echo "not a valid iso file "
			fi
				
		else 
			echo "not a file"
		fi
		;;

	5) 
		echo "###############################################################"
		echo "###############################################################"
		echo "#############  U choose ubuntu in 15.10 Desktop  ##############"
		echo "###############################################################"
		echo "###############################################################"
		echo "Enter the iso location"		
		read loc
		if [ -f "$loc" ]
		then
			if [ $(echo "$loc" | grep ".iso" ) ] 
			then
				echo "ya"
				cp $(echo $loc) ./ubuntu15.iso
				mkdir iso
				sudo mount -o loop ubuntu15.iso ./iso
				rsync -avr ./iso/ ./extract/
				sudo chmod 777 -R extract
				sudo umount ./iso
				sudo rm -R ./iso
				rm ./extract/isolinux/isolinux.cfg				
				rm ./extract/isolinux/txt.cfg
				rm ./extract/isolinux/langlist
				rm ./extract/preseed/ubuntu.seed
				cp ./files/15/isolinux.cfg ./extract/isolinux/isolinux.cfg
				cp ./files/15/txt.cfg ./extract/isolinux/txt.cfg
				#cp ./files/15/langlist ./extract/isolinux/langlist
				echo "###############################################################"
				echo "###############################################################"
				echo "########## Choose a language for installation purpose #########"
				echo "###############################################################"
				echo "###############################################################"
				echo "press 1 for arabic"
				echo "press 2 for belarusia"
				echo "press 3 for bosnian"
				echo "press 4 for chinese"
				echo "press 5 for czech"
				echo "press 6 for danish"
				echo "press 7 for english"
				echo "press 8 for english_us"
				echo "press 9 for french"
				echo "press 10 for german"
				#echo "press 11 for geek"
				echo "press 12 for hebrew"
				echo "press 13 for hindi"
				#echo "press 14 for arabic"
				echo "press 14 for japanese"
				#echo "press 15 for arabic"
				echo "press 15 for kannada"
				#echo "press 18 for arabic"
				echo "press 16 for malayalam"
				#echo "press 17 for arabic"
				echo "press 17 for portugese"
				echo "press 18 for russian"
				echo "press 19 for tamil"
				language="en_US.UTF-8"
				read lang
				case $lang in 
					1 )
						language="af_ZA.UTF-8";;
					2 )
						language="be_BY.UTF-8";;
					3 )
						language="bs_BA.UTF-8";;
					4 )
						language="zh_CN.UTF-8";; 
					5 )
						language="cs_CZ.UTF-8";;
					6 )
						language="da_DK.UTF-8";;
					7 )
						language="en_US.UTF-8";;
					8 )
						language="en.UTF-8";;
					9 )
						language="fr_FR.UTF-8";;
					10 )
						language="de_DE.UTF-8";;
					12 )
						language="he_IL.UTF-8";;
					13 )
						language="hi_IN.UTF-8"
						
						;;
					14 )
						language="ja_JP.UTF-8";;
					15 )
						language="kn_IN.UTF-8";;
					16 )
						language="ml_IN.UTF-8";;
					17 )
						language="pt_PT.UTF-8";;
					18 )
						language="ru_RU.UTF-8";;
					19 )
						language="ta_IN.UTF-8";;
					* )
						;;
				esac
				echo $language >> ./extract/isolinux/langlist
				echo "#########################################################"
				echo "#########################################################"
				printf " Enter the user-fullname::: "
				read fullname
				printf "\n Enter the username:::::::: "
				read username
				printf "\n Enter the password:::::::: "
				read password1
				printf "\n Enter the password again:: "
				read password2
				echo "######################################################################
################## preseed by aditya (M150102CS) #####################
######################################################################
\n# General
\n####################################################################
\n
\n# Once installation is complete, automatically power off.
\n# d-i finish-install/reboot_in_progress note
\nd-i debian-installer/exit/poweroff boolean true
\nd-i ubiquity/summary note
\nubiquity ubiquity/reboot boolean true
\nubiquity ubiquity/poweroff boolean true
\n
\n# Automatically download and install stable updates?
\nunattended-upgrades unattended-upgrades/enable_auto_updates boolean true
\n
\n
\n####################################################################
\n# Networking
\n####################################################################
\n# Network Configuration
\nd-i netcfg/enable boolean true
\nd-i netcfg/choose_interface select auto
\nd-i netcfg/disable_dhcp boolean false
\n
\n
\n####################################################################
\n# Disk Partitioning / Boot loader
\n####################################################################
\n
\n### Disk Partitioning ###
\n
\n# Configure auto partitioner
\nubiquity partman-auto/init_automatically_partition select Guided - use entire disk
\nubiquity partman-auto/disk string /dev/sda
\nubiquity partman-auto/method string regular
\nubiquity partman-auto/choose_recipe select All files in one partition (recommended for new users)
\nubiquity partman/confirm_write_new_label boolean true
\nubiquity partman/choose_partition select Finish partitioning and write changes to disk
\nubiquity partman/confirm boolean  true
\n
\n# If one of the disks that are going to be automatically partitioned
\n# contains an old LVM configuration, the user will normally receive a
\n# warning. This can be preseeded away...
\nd-i partman-lvm/device_remove_lvm boolean true
\n# The same applies to pre-existing software RAID array:
\nd-i partman-md/device_remove_md boolean true
\n# And the same goes for the confirmation to write the lvm partitions.
\nd-i partman-lvm/confirm boolean true

\nd-i partman-lvm/confirm boolean true
\nd-i partman/confirm_write_new_label boolean true
\nd-i partman/choose_partition select Finish partitioning and write changes to disk
\nd-i partman/confirm boolean true
\n# This makes partman automatically partition without confirmation.
\nd-i partman-md/confirm boolean true
\nd-i partman-partitioning/confirm_write_new_label boolean true
\nd-i partman/choose_partition select finish
\nd-i partman/confirm boolean true
\nd-i partman/confirm_nooverwrite boolean true

\n
\n####################################################################
\n# Localizations / Timezone
\n####################################################################
\n
\n### Keyboard selection ###
\nd-i keyboard-configuration/layoutcode string us
\nd-i keyboard-configuration/variantcode string
\n
\n### Locale ###
\nd-i debian-installer/locale string $language
\n
\n### Timezone ###
\nd-i time/zone select Europe/Amsterdam
\nd-i clock-setup/utc boolean true
\nd-i clock-setup/ntp boolean false
\nd-i console-setup/ask_detect boolean false
\nd-i console-setup/layoutcode string us
\n
\nd-i localechooser/supported-locales multiselect nl_NL, nl_BE, fr_BE
\n
\n
\n
\n####################################################################
\n# User Creation
\n####################################################################
\n
\n# Root User
\nd-i passwd/root-login boolean false
\n
\n# Mortal User
\nd-i passwd/user-fullname string $fullname
\nd-i passwd/username string $username
\nd-i passwd/user-password password $password1
\nd-i passwd/user-password-again password $password2
\nd-i passwd/auto-login boolean true
\nd-i user-setup/allow-password-weak boolean true
\n
\n
\n####################################################################
\n# Some extras
\n####################################################################
\ntasksel tasksel/first multiselect ubuntu-desktop
\nd-i pkgsel/include string build-essential isomaster uck clamav clamtk openconnect adobe-flashplugin vmware-view-client
\n
\n# installing languages
\n# Language pack selection
\nd-i pkgsel/language-packs multiselect nl, fr, en
\n
\n# Whether to upgrade packages after debootstrap.
\n# Allowed values: none, safe-upgrade, full-upgrade
\nd-i pkgsel/upgrade select none
\n
\n# Policy for applying updates. May be \"none\" (no automatic updates),
\n#d-i pkgsel/update-policy select unattended-upgrades
\n
\n# By default, the system's locate database will be updated after the
\n# installer has finished installing most packages. This may take a while, so
\n# if you don't want it, you can set this to \"false\" to turn it off.
\n#d-i pkgsel/updatedb boolean true
\n
\n# This command is run just before the install finishes, but when there is
\n# still a usable /target directory. You can chroot to /target and use it
\n# directly, or use the apt-install and in-target commands to easily install
\n# packages and run commands in the target system.
\n#d-i preseed/late_command string apt-install zsh; in-target chsh -s /bin/zsh
\n
\n# And now we REALLY run with it!!
\nd-i preseed/late_command string \
\nin-target apt-get remove unity-scope-imdb unity-scope-musicstores unity-scope-zotero unity-scope-click-autopilot \
\nin-target apt-get remove unity-scope-deviantart unity-scope-gallica unity-scope-gdocs unity-scope-github unity-scope-googlenews \
\nin-target apt-get remove unity-scope-launchpad unity-scope-mediascanner unity-scope-onlinemusic unity-scope-openweathermap \
\nin-target apt-get remove unity-scope-soundcloud unity-scope-sshsearch unity-scope-yahoostock unity-lens-photos unity-lens-video \
\nin-target apt-get remove unity-scope-audacious unity-scope-chromiumbookmarks unity-scope-clementine unity-scope-click unity-scope-colourlovers \
\nin-target apt-get remove unity-scope-gdrive unity-scope-gmusicbrowser unity-scope-gourmet unity-scope-guayadeque unity-scope-mediascanner2 \
\nin-target apt-get remove unity-scope-musique unity-scope-openclipart unity-scope-texdoc unity-scope-tomboy unity-scope-video-remote \
\nin-target apt-get remove unity-scope-virtualbox unity-scope-yelp unity-webapps-service account-plugin-ubuntuone ubuntu-purchase-service \
\n
\nin-target cp /cdrom/preseed/install.sh . ;\
\nin-target chmod +x install.sh ;\
\nin-target cp /cdrom/preseed/vpn.zip . ;\
\nin-target unzip vpn.zip ;\
\nin-target chmod +x vpn/vpn_install.sh ;\
\nin-target sh vpn/vpn_install.sh ;\
\nin-target sh install.sh ;\
\nin-target rm install.sh"	>> ./extract/preseed/ubuntu.seed
				##########cp ./files/15/u_preseed ./extract/preseed/ubuntu.seed
				sudo mkisofs -r -V "output.iso" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o output.iso ./extract
				sudo chmod 777 output.iso
				rm -R extract
				rm ubuntu15.iso
				
			else 
				echo "not a valid iso file "
			fi
				
		else 
			echo "not a file"
		fi
		;;
	#############
	#############
	#############
	6 )
		echo "###############################################################"
		echo "###############################################################"
		echo "#############  U choose ubuntu in 15.10 Server   ##############"
		echo "###############################################################"
		echo "###############################################################"
		echo "Enter the iso location"		
		read loc
		if [ -f "$loc" ]
		then
			if [ $(echo "$loc" | grep ".iso" ) ] 
			then
				echo "ya"
				cp $(echo $loc) ./ubuntu15.iso
				mkdir iso
				sudo mount -o loop ubuntu15.iso ./iso
				rsync -avr ./iso/ ./extract/
				sudo chmod 777 -R extract
				sudo umount ./iso
				sudo rm -R ./iso
				rm ./extract/isolinux/isolinux.cfg				
				rm ./extract/isolinux/txt.cfg
				rm ./extract/isolinux/langlist
				rm ./extract/preseed/ubuntu-server.seed
				cp ./files/15ser/isolinux.cfg ./extract/isolinux/isolinux.cfg
				#cp ./files/15ser/txt.cfg ./extract/isolinux/txt.cfg
				#cp ./files/15/langlist ./extract/isolinux/langlist
				echo "###############################################################"
				echo "###############################################################"
				echo "########## Choose a language for installation purpose #########"
				echo "###############################################################"
				echo "###############################################################"
				echo "press 1 for arabic"
				echo "press 2 for belarusia"
				echo "press 3 for bosnian"
				echo "press 4 for chinese"
				echo "press 5 for czech"
				echo "press 6 for danish"
				echo "press 7 for english"
				echo "press 8 for english_us"
				echo "press 9 for french"
				echo "press 10 for german"
				#echo "press 11 for geek"
				echo "press 12 for hebrew"
				echo "press 13 for hindi"
				#echo "press 14 for arabic"
				echo "press 14 for japanese"
				#echo "press 15 for arabic"
				echo "press 15 for kannada"
				#echo "press 18 for arabic"
				echo "press 16 for malayalam"
				#echo "press 17 for arabic"
				echo "press 17 for portugese"
				echo "press 18 for russian"
				echo "press 19 for tamil"
				language="en_US.UTF-8"
				read lang
				case $lang in 
					1 )
						language="af_ZA.UTF-8";;
					2 )
						language="be_BY.UTF-8";;
					3 )
						language="bs_BA.UTF-8";;
					4 )
						language="zh_CN.UTF-8";; 
					5 )
						language="cs_CZ.UTF-8";;
					6 )
						language="da_DK.UTF-8";;
					7 )
						language="en_US.UTF-8";;
					8 )
						language="en.UTF-8";;
					9 )
						language="fr_FR.UTF-8";;
					10 )
						language="de_DE.UTF-8";;
					12 )
						language="he_IL.UTF-8";;
					13 )
						language="hi_IN.UTF-8"
						
						;;
					14 )
						language="ja_JP.UTF-8";;
					15 )
						language="kn_IN.UTF-8";;
					16 )
						language="ml_IN.UTF-8";;
					17 )
						language="pt_PT.UTF-8";;
					18 )
						language="ru_RU.UTF-8";;
					19 )
						language="ta_IN.UTF-8";;
					* )
						;;
				esac
				echo $language > ./extract/isolinux/langlist
				txt="default install
\nlabel install
\n  menu label ^Install Ubuntu Server
\n  kernel /install/vmlinuz
\n  append locale=$language keyboard-configuration/layoutcode=us file=/cdrom/preseed/ubuntu-server.seed vga=788 initrd=/install/initrd.gz quiet --
"
				echo $txt > ./extract/isolinux/txt.cfg
				echo "#########################################################"
				echo "#########################################################"
				printf " Enter the user-fullname::: "
				read fullname
				printf "\n Enter the username:::::::: "
				read username
				printf "\n Enter the password:::::::: "
				read password1
				printf "\n Enter the password again:: "
				read password2
				printf "\n Enter the hostname::::::::"
				read hostname
				echo "######################################################################
################## preseed by aditya (M150102CS) #####################
######################################################################
\n# General
\n####################################################################
## Options to set on the command line
\nd-i debian-installer/locale string $language
\nd-i console-setup/ask_detect boolean false
\nd-i console-setup/layout string us
\n
\nd-i netcfg/enable boolean false
\nd-i netcfg/get_hostname string $hostname
\nd-i netcfg/get_domain string unassigned-domain
\n
\nd-i time/zone string UTC
\nd-i clock-setup/utc-auto boolean true
\nd-i clock-setup/utc boolean true
\n
\nd-i kbd-chooser/method select American English
\n
\nd-i netcfg/wireless_wep string
\n
\nd-i base-installer/kernel/override-image string linux-server
\n
\nd-i debconf debconf/frontend select Noninteractive
\n
\nd-i pkgsel/install-language-support boolean false
\ntasksel tasksel/first multiselect standard, ubuntu-server
\n
\nd-i partman-auto/method string lvm
\n
\nd-i partman-lvm/confirm boolean true
\nd-i partman-lvm/device_remove_lvm boolean true
\nd-i partman-auto/choose_recipe select atomic
\n
\nd-i partman/confirm_write_new_label boolean true
\nd-i partman/confirm_nooverwrite boolean true
\nd-i partman/choose_partition select finish
\nd-i partman/confirm boolean true
\n
\n# Write the changes to disks and configure LVM?
\nd-i partman-lvm/confirm boolean true
\nd-i partman-lvm/confirm_nooverwrite boolean true
\nd-i partman-auto-lvm/guided_size string max
\n
\n### Keyboard selection ###
\nd-i keyboard-configuration/layoutcode string us
\nd-i keyboard-configuration/variantcode string
\n
\n### Locale ###
\nd-i debian-installer/locale string en_US
\n
\n
\n# Default user
\nd-i passwd/user-fullname string $fullname
\nd-i passwd/username string $username
\nd-i passwd/user-password password $password1
\nd-i passwd/user-password-again password $password2
\nd-i user-setup/encrypt-home boolean false
\nd-i user-setup/allow-password-weak boolean true
\n
\n# Minimum packages (see postinstall.sh)
\nd-i pkgsel/include string openssh-server ntp
\n
\n# Upgrade packages after debootstrap? (none, safe-upgrade, full-upgrade)
\n# (note: set to none for speed)
\nd-i pkgsel/upgrade select none
\n
\nd-i grub-installer/only_debian boolean true
\nd-i grub-installer/with_other_os boolean true
\nd-i finish-install/reboot_in_progress note
\n
\nd-i pkgsel/update-policy select none
\n
\nchoose-mirror-bin mirror/http/proxy string
\n"	>> ./extract/preseed/ubuntu-server.seed
				##########cp ./files/15/u_preseed ./extract/preseed/ubuntu.seed
				sudo mkisofs -r -V "output.iso" -cache-inodes -J -l -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -o output.iso ./extract
				sudo chmod 777 output.iso
				rm -R extract
				rm ubuntu15.iso
				
			else 
				echo "not a valid iso file "
			fi
				
		else 
			echo "not a file"
		fi
		;;
	* ) 
		echo "not a valid option "
		exit
		;;
esac
