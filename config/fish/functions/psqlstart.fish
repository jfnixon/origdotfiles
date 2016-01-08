function psqlstart
	/usr/local/pgsql/bin/pg_ctl -D /usr/local/pgsql/data -l logfile start $argv;
end
