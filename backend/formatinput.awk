BEGIN {
        t0 = systime();
}

{
if (NF != 2) {}
else{
if (NR > 1) {
	if (ips[$2] =="" ) {
        	ips[$2] = $1
	}
	else {
		if (index(ips[$2],$1) == 0) {ips[$2] = ips[$2]" "$1; }
	}
#	ips[$2] = ips[$2]" "$1;

	if (systime() - t0 >= 10) {
        	for (src in ips) {
                	print src" "ips[src];
        	}
        	t0 = systime();
	}

}
}
}

