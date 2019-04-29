docker run -it -v "C:\temp":/export frapsoft/openssl genrsa -out /export/ra-svr.tridentspectre.esri.private.key 2048

docker run -it -v "C:\temp":/export frapsoft/openssl req -new -key /export/ra-svr.tridentspectre.esri.private.key -out /export/ra-svr.tridentspectre.esri.private.csr

docker run -it -v "C:\temp":/export frapsoft/openssl x509 -req -in /export/ra-svr.tridentspectre.esri.private.csr -CA /export/myCA.pem -CAkey /export/myCA.key -CAcreateserial -out /export/ra-svr.tridentspectre.esri.private.crt -days 1825 -sha256 -extfile /export/ra-svr.tridentspectre.esri.private.ext

docker run -it -v "C:\temp":/export frapsoft/openssl pkcs12 -export -out /export/ra-svr.tridentspectre.esri.private.pfx -inkey /export/ra-svr.tridentspectre.esri.private.key -in /export/ra-svr.tridentspectre.esri.private.crt