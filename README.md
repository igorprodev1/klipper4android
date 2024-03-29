# klipper4android
install klipper on android without root

TERMUX
// ssh server run
sshd

// files locations
ls $PREFIX/var/lib/proot-distro/installed-rootfs/ubuntu

pkg install proot-distro
proot-distro list
proot-distro install ubuntu
proot-distro login ubuntu

termux-usb -l
proot-distro login --bind /dev/bus/usb/001/002:/dev/bus/usb/001/002 ubuntu
UBUNTU

// nginx
sudo service nginx status

// start-stop-daemon --start --quiet --exec $KLIPPY_EXEC --background --pidfile $PIDFILE --make-pidfile --chuid $KLIPPY_USER --user $KLIPPY_USER -- $KLIPPY_ARGS

sudo /home/ihor/klippy-env/bin/python /home/ihor/klipper/klippy/klippy.py /home/ihor/printer_data/config/printer.cfg -l /home/ihor/printer_data/logs/klippy.log -I /home/ihor/printer_data/comms/klippy.serial -a /home/ihor/printer_data/comms/klippy.sock &

sudo /home/ihor/moonraker-env/bin/python /home/ihor/moonraker/moonraker/moonraker.py -d /home/ihor/printer_data &
/home/pi/moonraker-env/bin/python /home/pi/moonraker/moonraker/moonraker.py -d /home/pi/printer_data &

// edit. SD card check return empty object
moonraker/moonraker/components/machine.py

./klipper/scripts/klipper-start.sh start

links
// very helpfull topic
https://www.reddit.com/r/klippers/comments/tc8r4q/klippermainsail_on_android_phone/

// long read about termux abilities
https://habr.com/ru/articles/652633/

https://github.com/knoopx/alpine-klipper

AnLinux

https://f-droid.org/

// docker image for klipper and octoprint
https://github.com/mkuf/prind

// docker image for klipper
https://github.com/LRGEX/Klipper-docker
https://github.com/dimalo/klipper-web-control-docker

//appine klipper install script
https://github.com/knoopx/alpine-klipper/blob/master/install.sh

// usb serial for android java library
https://github.com/knoopx/alpine-klipper/blob/master/install.sh


// deps for moonraker
apk add python3-dev lmdb-dev openjpeg libsodium-dev zlib-dev jpeg-dev wireless-tools curl

// deps for klipper
apk add py3-cffi py3-greenlet linux-headers can-utils
pip3 install python-can

// alpine deps for pithone wheels build
apk add python3-dev gcc g++ musl-dev linux-headers patch build-base alpine-sdk

mkdir ./printer_data/
mkdir ./printer_data/config
mkdir ./printer_data/logs
mkdir ./printer_data/gcodes
mkdir ./printer_data/systemd
mkdir ./printer_data/comms
touch ./printer_data/config/printer.cfg
touch ./printer_data/config/moonraker.conf

// 3 patches needed for moonraker
sed -i 's/max_dbs=MAX_NAMESPACES)/max_dbs=MAX_NAMESPACES, lock=False)/' /moonraker/moonraker/components/database.py
// sd card permission denide in android linux container
sed -i 's/self._get_sdcard_info()/{}/' /moonraker/moonraker/components/machine.py
// checking service return exception, after this script disables write axess
sed -i 's/fm.disable_write_access()/#fm.disable_write_access()/' /moonraker/moonraker/components/machine.py

// mainsail

mkdir /etc/nginx/sites-available/
mkdir /etc/nginx/conf.d/
mkdir /etc/nginx/sites-enabled/
touch /etc/nginx/sites-available/mainsail
touch /etc/nginx/conf.d/upstreams.conf
touch /etc/nginx/conf.d/common_vars.conf

mkdir ./mainsail

rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/mainsail /etc/nginx/sites-enabled/

include /etc/nginx/sites-enabled/*.*;

netstat -tulpn | grep LISTEN

resp = await self.addr_cmd.run_with_response
/home/pi/moonraker/moonraker/components/shell_command.py

ssh -p 8022 root@192.168.0.109

sh://root@192.168.0.109:8022