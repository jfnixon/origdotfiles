function nmount
	echo "DEVICE PATH TYPE FLAGS"
mount | awk '$2="";1' | column -t
end
