### kodi-hub

This is the raspberry pi port of [kodi-hub](https://github.com/rquez/docker-files)


Share and sync your kodi libraries.
Shares the content at `/mnt` via samba, which can be added and scraped in kodi. 
This container also runs MySQL to synchronize kodi libraries for mutliple devices.
Kodi installations with a `advancedsettings.xml` and `sources.xml` pointing to the host of the container, sync together.
See this [kodi wiki article](http://kodi.wiki/view/MySQL) for more information.

###### build

`docker build -t kodi-hub .`

###### run

`docker run -d -p 137:137 -p 138:138 -p 139:139 -p 445:445 -p 3306:3306 -v /mnt:/mnt/ kodi-hub`

###### config

I've included an example `advancedsettings.xml` and `sources.xml`.
In `advancedsettings.xml`, edit the host field for each database to the host of the container.
In `sources.xml`, edit path for each source so it points to the samba host.
Then place the files in kodi's [userdata](http://kodi.wiki/view/Userdata) directory.
