function pg-stop
	pg_ctl -D /usr/local/var/postgres stop -s -m fast $argv;
end
