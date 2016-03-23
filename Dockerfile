FROM ubuntu:14.04
MAINTAINER CenturyLinkLabs, jamiesun <jamiesun.net@gmail.com>

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y upgrade

# Add image configuration and scripts
RUN apt-get install -y mysql-server

ADD my.cnf /etc/mysql/conf.d/my.cnf 
ADD my-1G.cnf /etc/my-1G.cnf 
ADD my-4G.cnf /etc/my-4G.cnf 
ADD my-512M.cnf /etc/my-512M.cnf 

ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

ADD dbutils /usr/local/bin/dbutils
RUN chmod +x /usr/local/bin/dbutils

RUN cp /code/crontabfile /etc/crontab
RUN crontab /etc/crontab

VOLUME ["/var/lib/mysql"]
VOLUME ["/var/backup"]

CMD ["/usr/local/bin/run"]
