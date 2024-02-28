if systemctl is-active --quiet bluetooth
then 
	systemctl stop bluetooth
else 
	systemctl start bluetooth
fi
