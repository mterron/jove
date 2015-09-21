function geolocate(IP,   stdout) {
	stdout="";
	command="xargs -n1 geoiplookup |awk -F, '{print $(NF-3)\",\"$(NF-2);fflush()}'"
#	print "geolocating: "IP;
	print IP |& command;
	command |& getline stdout;
#	"geoiplookup " IP "| awk -F, '{print $(NF-3)\",\"$(NF-2)}'"| getline stdout;
#	print "geolocation: " stdout;
#	fflush();
	return stdout
}
BEGIN {
#        t0 = systime();
}
{
#print "-------------------------------------------------------------------------------------------------------\n";
#print "input is: "$0;
#"geoiplookup " $1 "| awk -F, '{print $(NF-3)\",\"$(NF-2)}'" | getline dgeoout; dst = "["dgeoout"]";
dst = "["geolocate($1)"]";
for (i=2;i <= NF;i++) {
#	"geoiplookup " $i "| awk -F, '{print $(NF-3)\",\"$(NF-2)}'" | getline sgeoout;
	geoout=geolocate($i);
	if ((geoout == "") || (index(src, geoout) > 0) ) {}
	else{
 		if (i > 2) {src = src ",["geoout"]";}
 		else {src  = "["geoout"]";}
	}

geoout="";
}
#print "src is: "src"\n-------------------------------------------------------------------------------------------------------\n";
#if (systime() - t0 >=2) {
	print "{\"dst\":"dst", \"src\": [ "src" ]}"; 
	dst =""; src="";stdout="";geoout="";
#	t0 = systime ();
#}
}
