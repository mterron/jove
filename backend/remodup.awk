{
{
delete p;
n = split($0, a, " ");
printf("%s", a[1]);
for (i = 2; i <= n ; i++) {
	if (!(a[i] in p)) {
		printf(" %s", a[i]);
		p[a[i]] = "";
	}
}
printf "\n";
}
}
