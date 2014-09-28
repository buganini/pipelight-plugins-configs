#!/bin/sh

case $1 in
	"create")
		plugin=$2
		cd /usr/lib/pipelight/ && cp libpipelight.so libpipelight-${plugin}.so
		cd /usr/lib/mozilla/plugins/ && ln -s /usr/lib/pipelight/libpipelight-${plugin}.so libpipelight-${plugin}.so
		echo "0) read detail in README.md"
		echo "1) place config in /usr/share/pipelight/configs"
		echo "2) install your program"
		echo "3) restart browser"
	;;
	"install")
		plugin=$2
		cp pipelight-${plugin} /usr/share/pipelight/configs/
		cd /usr/lib/pipelight/ && cp libpipelight.so libpipelight-${plugin}.so
		cd /usr/lib/mozilla/plugins/ && ln -s /usr/lib/pipelight/libpipelight-${plugin}.so libpipelight-${plugin}.so
		echo "0) read detail in README.md"
		echo "1) install your program"
		echo "2) restart browser"
	;;
	"remove")
		plugin=$2
		rm -f /usr/lib/pipelight/libpipelight-${plugin}.so
		rm -f /usr/lib/mozilla/plugins/libpipelight-${plugin}.so
		rm -f /usr/share/pipelight/configs/pipelight-${plugin}
	;;
esac
