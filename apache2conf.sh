#!/bin/bash
### colors ###
rougefonce='\e[0;31m'
neutre='\e[0;m'
vert="\033[1;32m"
#### purge et installation de apache/bind9 ####
apacheAndBind9(){
sudo apt-get --purge remove bind9 -y &> /dev/null
sudo apt-get install bind9 -y &> /dev/null
sudo apt-get --purge remove apache2 -y &> /dev/null
sudo apt-get remove apache2-common -y &> /dev/null
apt-get install apache2 -y &> /dev/null
sudo systemctl enable apache2 &> /dev/null
}
#### mise en place du site ####
site(){
if [ -d /var/www/html ]; then
	sudo cp index.html /var/www/html
fi
sudo a2dissite 000-default.conf
if [ -d /etc/apache2/sites-available ]; then
	sudo rm /etc/apache2/sites-available/000-default.conf
	sudo cp /home/test/Bureau/DNSetApache/apache/ANSINELLiBERRANDEYECO.conf /etc/apache2/sites-available/
fi

if [ -f /etc/hosts ]; then
	sudo rm /etc/hosts
	sudo cp /home/test/Bureau/DNSetApache/apache/hosts /etc/
else
	sudo cp /home/test/Bureau/DNSetApache/apache/hosts /etc/
fi
}
#### activation du site et restart apache ####
restartApache(){
sudo a2ensite "ANSINELLiBERRANDEYECO.conf"
sudo systemctl reload apache2 &> /dev/null
}
### mise en place conf dns ###
confDNS(){
if [ -d /etc/bind ]; then
	sudo rm /etc/bind/named.conf.options
	sudo cp ../DNS/named.conf.options /etc/bind/
fi
if [ -f /etc/resolv.conf -a ../DNS ]; then
	sudo rm /etc/resolv.conf
	sudo cp ../DNS/resolv.conf /etc/
sudo systemctl restart bind9
fi
}
### waiter ###
spanner(){
PROC=$$;COUNT=0
echo -n "Please wait ["

while [ -d /proc/$PROC ];do
  while [ "$COUNT" -lt 10 ];do
    echo -n -e "${vert}▓" ; sleep 1.3
    ((COUNT++))
  done
  until [ "$COUNT" -eq 0 ];do
    echo -n -e "${vert}▓" ; sleep 1.3
    ((COUNT -= 1))
  done
  echo -e "${neutre}]"
done
}

prog(){
apacheAndBind9
site
restartApache
confDNS
systemctl start apache2
}

### finish ###
dd if=/dev/zero  of=/dev/null count=10000000 >/dev/null 2>&1 &
prog &> /dev/null & spanner $(pidof dd)
echo

echo ''
echo -e "${vert} Apache2 et DNS configurer avec succes"
echo ''

