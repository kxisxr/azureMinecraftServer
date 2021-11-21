#!/bin/bash
#Creator: kxisxr
greenColour="\x1B[0;32m\033[1m"
endColour="\033[0m\x1B[0m"
redColour="\x1B[0;31m\033[1m"
blueColour="\x1B[0;34m\033[1m"
yellowColour="\x1B[0;33m\033[1m"
purpleColour="\x1B[0;35m\033[1m"
turquoiseColour="\x1B[0;36m\033[1m"
grayColour="\x1B[0;37m\033[1m"

echo -e "${greenColour}""

▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
▒▒████▒▒▒▒████▒▒
▒▒████▒▒▒▒████▒▒
▒▒▒▒▒▒████▒▒▒▒▒▒
▒▒▒▒████████▒▒▒▒
▒▒▒▒████████▒▒▒▒
▒▒▒▒██▒▒▒▒██▒▒▒▒
▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
                               _______ __                               ___ __   _______
.---.-.-----.--.--.----.-----.|   |   |__|.-----.-----.----.----.---.-.'  _|  |_|     __|.-----.----.--.--.-----.----.
|  _  |-- __|  |  |   _|  -__||       |  ||     |  -__|  __|   _|  _  |   _|   _|__     ||  -__|   _|  |  |  -__|   _|
|___._|_____|_____|__| |_____||__|_|__|__||__|__|_____|____|__| |___._|__| |____|_______||_____|__|  \___/|_____|__|

by kxisxr
@pixelbit131
""${endColour}"

echo -e "${blueColour}"'-----------------------------------------------------------------------------------------'"${endColour}"
echo -e ' '

 if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo -e "${redColour}"'Not running as root, Exiting...'"${endColour}\n"
    echo -e "${greenColour}"'Example:'"\n${endColour}""${grayColour}"'sudo su'"${endColour}"
    echo -e "${grayColour}"'root@MinecraftAzure'"${endColour}" "${grayColour}"'./azureMinecraftServer.sh'"${endColour}\n"
    exit
fi

usr=$(cat /etc/passwd | grep 1000 | tr ':' ' ' | awk '{print $1}')

echo -e "${greenColour}"'Adding the alias... '"${endColour}"
echo "alias startServer='cd /home/$usr/azureMinecraftServer/server; java -Xmx6000M -Xms4000M -jar server.jar nogui'" >> ~/.bashrc
sleep 1

echo -e "${greenColour}"'Installing the jre... '"${endColour}"
apt-get install default-jre-headless -y >/dev/null 2>&1
sleep 1

echo -e "${greenColour}"'Adding java repository... '"${endColour}"
add-apt-repository ppa:linuxuprising/java -y >/dev/null 2>&1
sleep 1

echo -e "${greenColour}"'Installing openjdk 16... '"${endColour}"
apt-get install openjdk-16-jdk -y
sleep 1

clear

echo -e "${greenColour}"'Installing misc... '"${endColour}"
apt-get install unzip wget screen -y >/dev/null 2>&1
sleep 1

jversion=$(javac --version)
echo -e "${greenColour}"'Javac version:' $jversion"${endColour}"
sleep 1

mkdir server; cd server
echo -e "${greenColour}"'Downloading the minecraft launcher... '"${endColour}"
wget https://launcher.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar >/dev/null 2>&1

echo -e "${greenColour}"'Initializing the server... '"${endColour}"
java -Xmx6000M -Xms4000M -jar server.jar nogui >/dev/null 2>&1
sleep 2

echo -e "${greenColour}"'Fixing the error... '"${endColour}"
sed -i 's/eula=false/eula=true/g' eula.txt
sleep 2

echo -e "${greenColour}"'Re-initializing the server... '"${endColour}"
java -Xmx6000M -Xms4000M -jar server.jar nogui

echo -e "\n${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}\n"
echo -e "${turquoiseColour}"'[!] IMPORTANT: Write the command '"${endColour}""${grayColour}"'source ~/.bashrc'"${endColour}""${turquoiseColour}"'once you shut down or pause the server, in order to initialize it with the command '"${grayColour}"'startServer.'"${endColour}"
echo -e "\n${blueColour}"'--------------------------------------------------------------------------------------------------------'"${endColour}\n"
