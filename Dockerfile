FROM ubuntu:16.04
LABEL maintainer=milobahg
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y dist-upgrade && apt-get clean
RUN apt-get install -y curl python-software-properties git build-essential apache2
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g grunt-cli
RUN git clone https://github.com/gchq/CyberChef.git
WORKDIR /CyberChef
RUN npm install
RUN grunt prod
RUN cp -r /CyberChef/build/prod/* /var/www/html/
EXPOSE 80
ENV APACHE_RUN_USER    www-data
ENV APACHE_RUN_GROUP   www-data
ENV APACHE_PID_FILE    /var/run/apache2.pid
ENV APACHE_RUN_DIR     /var/run/apache2
ENV APACHE_LOCK_DIR    /var/lock/apache2
ENV APACHE_LOG_DIR     /var/log/apache2
ENV LANG               C
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
