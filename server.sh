#!/bin/sh
echo "Warning: If you are using an OpenBSD rather than FreeBSD, add -p to nc"
while true
do
{   
	# For openbsd, add -p to nc
	 echo 'HTTP/1.1 200 OK
Access-Control-Allow-Origin: *
Content-Type: application/json

' \
'
{"Hello":"world", "apples" : "oranges"}' \
	| nc -l -p 8089 \
	| grep "GET"
}  	| grep "HTTP" \
	| perl -pe 's{.*param1=(.*).title=(.*).HTTP.1.1}{"$2","$1"\n$1\n}g' \
	| perl -pe 's/%([0-9a-f]{2})/sprintf("%s", pack("H2",$1))/eig' \
	| tee -a ~/work.txt; 
done;
