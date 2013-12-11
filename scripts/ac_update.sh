#!/bin/sh

dbus_session_file=$HOME/.dbus/session-bus/$(dbus-uuidgen --get)-0
if [ -e "$dbus_session_file" ]; then
	sleep 1
	source "$dbus_session_file"
	export DBUS_SESSION_BUS_ADDRESS DBUS_SESSION_BUS_PID DBUS_SESSION_BUS_WINDOWID
	echo 'updateBattIcon()' | awesome-client
	if [ "$1" = 1 ]; then
		echo 'naughty.notify({ text="Ladekabel angeschlossen.", title="Akku wird geladen!", fg="#87af5f", icon="/home/viktor/.config/awesome/themes/colored/widgets/green/ac_01.png" })' | awesome-client
	else
		echo 'naughty.notify({ text="Ladekabel entfernt.", title="Akku wird entladen!", icon="/home/viktor/.config/awesome/themes/colored/widgets/blue/bat_full_01.png" })' | awesome-client
	fi
fi
