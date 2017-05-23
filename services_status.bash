#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

#service_status=`sudo systemctl  status nginx  | grep Active | cut -d" " -f5 | cut -d" " -f1`
services=(redis mongod elasticsearch php-fpm nginx uwsgi celeryd celerybeatd postgresql-9.4 tomcat cyops-auth)


for service in ${services[@]}; do
        service_status=`sudo systemctl  status $service  | grep Active | cut -d" " -f5`
	if [ "active" ==  $service_status ]
	then
	       echo ${green}$service " is active.${reset}"
	else
	       echo ${red}$service " is inactive.${reset}"
	fi
done
