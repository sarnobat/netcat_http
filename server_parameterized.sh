#!/bin/sh
# Usage
#  sh server_parameterized.sh "sh prog.sh" 4457
# xdg-open http://netgear.rohidekar.com:4457

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
' `$1`  \
	| nc -l -p $2 
}
done;
