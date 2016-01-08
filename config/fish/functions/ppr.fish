function ppr
	enscript -2qCG -Eruby -f Courier8 -r -p - {$1} | lpr
end
