function mach
	echo -e "\nMachine information:" ; uname -a
  echo -e "\nUsers logged on:" ; w -h
  echo -e "\nCurrent date :" ; date
  echo -e "\nMachine status :" ; uptime
  echo -e "\nMemory status :" ; mstat.py
  echo -e "\nFilesystem status :"; df -h
end
