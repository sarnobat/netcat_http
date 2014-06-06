#!/bin/sh
echo "Warning: If you are using an OpenBSD rather than FreeBSD, add -p to nc"
while true
do
{   
	# For openbsd, add -p to nc
	 echo 'HTTP/1.1 200 OK
Date: Fri, 30 May 2014 03:01:37 GMT
Access-Control-Allow-Origin: *
Server: Apache/2.2.22 (Ubuntu)\nLast-Modified: Thu, 29 May 2014 03:26:28 GMT\nETag: "29ffda-3fb4-4fa817e984137"\nAccept-Ranges: bytes\nVary: Accept-Encoding\nContent-Type: text/html\n\n'$(cat ~/trash/test.eml) \
|  nc -l -p 8089   | grep "GET"
} | grep "HTTP" \
| perl -pe 's{.*param1=(.*).title=(.*).HTTP.1.1}{"$2","$1"\n$1\n}g' \
| perl -pe 's/%([0-9a-f]{2})/sprintf("%s", pack("H2",$1))/eig' \
| tee -a ~/work.txt; 
done;
