#!/bin/bash
set -e
COL='\033[1;32m'
NC='\033[0m' # No Color
echo -e "${COL}Setting up moonraker"

# read -p "Do you have \"Plugin extras\" installed? (y/n): " -n 1 -r
# if [[ ! $REPLY =~ ^[Yy]$ ]]
# then
#     echo -e "${COL}\nPlease go to settings and install plugin extras${NC}"
#     [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
# fi

# echo -e "${COL}\nInstalling dependencies...\n${NC}"
# # install required dependencies
# apk add py3-cffi py3-greenlet linux-headers can-utils
# pip3 install python-can

# echo -e "${COL}Downloading klipper\n${NC}"
# curl -o klipper.zip -L https://github.com/Klipper3d/klipper/archive/refs/heads/master.zip

# echo -e "${COL}Extracting klipper\n${NC}"
# unzip klipper.zip
# rm -rf klipper.zip
# mv klipper-master /klipper
# echo "# replace with your config" >> /root/printer.cfg

mkdir -p /root/extensions/moonraker
cat << EOF > /root/extensions/moonraker/manifest.json
{
        "title": "Moonraker plugin",
        "description": ""
}
EOF

cat << EOF > /root/extensions/moonraker/start.sh
#!/bin/sh
/home/pi/moonraker-env/bin/python /home/pi/moonraker/moonraker/moonraker.py -d /home/pi/printer_data
EOF

cat << EOF > /root/extensions/moonraker/kill.sh
#!/bin/sh
pkill -f 'moonraker\.py'
EOF
chmod +x /root/extensions/moonraker/start.sh
chmod +x /root/extensions/moonraker/kill.sh
chmod 777 /root/extensions/moonraker/start.sh
chmod 777 /root/extensions/moonraker/kill.sh

cat << EOF
${COL}
Moonraker installed!
Please kill the app and restart it again to see it in extension settings${NC}
EOF