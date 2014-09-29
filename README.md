Status
------

|   | about:plugins | works | detail |
|:-:|:-:|:-:|---|
| qvod  | Y | N | [#4](https://github.com/buganini/pipelight-plugins-configs/issues/4) |
| xfplay  | Y | 80% | [#1](https://github.com/buganini/pipelight-plugins-configs/issues/1) |
| xigua  | Y | N | [#2](https://github.com/buganini/pipelight-plugins-configs/issues/2) |
| jjvod  | Y | Y | [#3](https://github.com/buganini/pipelight-plugins-configs/issues/3) |

Quick Start
------

	sudo ./util.sh install jjvod # install
	sudo ./util.sh create blah # create empty plugin, you'll have to place a config file later
	sudo ./util.sh remove blah # cleanup installed files, including config file

Detail
------

- Enable a random bundled pipelight plugin to make sure other things is working

- cd /usr/lib/pipelight/ && cp libpipelight.so libpipelight-xxoo.so

	- xxoo must be in lower case, it's just a name

	- must use cp, ln will make a group in about:plugins

- cd /usr/share/pipelight/configs && cp pipelight-flash pipelight-xxoo

	- or pick a config file you want

	- or copy files from this repo

- Edit pipelight-xxoo

	- change regKey according to {HKCU,HKLM}\Software\MozillaPlugins

	- or use dllPath/dllName, refering information in about:plugins of firefox under windows

- cd /usr/lib/mozilla/plugins/ && ln -s /usr/lib/pipelight/libpipelight-xxoo.so libpipelight-xxoo.so

	- enable mozilla plugin

- env WINEPREFIX=$HOME/.wine-pipelight /usr/share/pipelight/wine xxoo-installer.exe

	- install the plugin itself

- restart firefox, check about:plugins

Debug
-----

- env WINEPREFIX=$HOME/.wine-pipelight /usr/share/pipelight/wine /usr/share/pipelight/pluginloader.exe --dllPath "C:\\\\Program Files\\\\QvodPlayer\\\\" --dllName npQvodInsert.dll

	- check if dll is working

	- it also accept --regKey

- run firefox in commandline, check output

	- if there is no related message, open about:support, click the button to open profile folder, delete pluginreg.dat, then restart firefox
