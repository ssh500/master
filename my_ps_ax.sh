#!/bin/bash

process=$(ls /proc/ | grep -v '(acpi\|asound\|bus\|driver\|fs\|irq\|net\|sys\|sysvipc\|tty)' | grep -v acpi | grep -v tty)

for i in $process
do
	if [[ -d /proc/$i ]]; then
	echo  "PID: $(strings /proc/$i/status | grep -w Pid | awk '{print $2}')"  "STATUS: $(grep State /proc/103/status | awk '{print $2}')"  "TTY: $(strings /proc/$i/stat | awk '{print $7}')" "CMD: $(strings /proc/$i/comm)" "CPU TIME $(strings /proc/$i/stat | awk '{print $14 +$15}')"  2>/dev/null

#	else echo "$i is file" 2>/dev/null
	fi
done
