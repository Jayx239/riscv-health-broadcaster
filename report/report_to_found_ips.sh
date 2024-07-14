
IPS=$(arp -a | sed -En 's/.*\((.*)\).*/\1/p')

for fn in $IPS; do
	./report.sh $fn
done

