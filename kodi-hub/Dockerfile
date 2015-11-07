FROM ubuntu:latest

# Install latest updates
RUN apt-get update

# Install mysql, samba and supervisor
RUN apt-get -y install mysql-client mysql-server curl samba supervisor

# Enable remote access (default is localhost only, we change this
# otherwise our database would not be reachable from outside the container)
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Set Standard settings
ENV user kodi
ENV password kodi

# Install mysql start script
ADD ./kodi-db.sh /usr/local/bin/kodi-db.sh
RUN chmod +x /usr/local/bin/kodi-db.sh

COPY smb.conf /etc/samba/smb.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Pregenerate password database to prevent warning messages on container startup
RUN /usr/sbin/smbd && sleep 10 && smbcontrol smbd shutdown

EXPOSE 137 138 139 445 3306

# Start supervisor on run
CMD /usr/bin/supervisord
