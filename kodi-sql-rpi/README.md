### kodi-hub

This is the raspberry pi port of [kodi-hub](https://github.com/rquez/docker-files) without Samba.


###### build

`docker build -t kodi-sql-rpi .`

###### run

`docker run -d -p 3306:3306 kodi-sql-rpi`
