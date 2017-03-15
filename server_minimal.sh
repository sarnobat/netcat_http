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
	| nc -l -p 4457 
}
done;
