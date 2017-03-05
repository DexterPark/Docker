FROM phusion/baseimage:latest
MAINTAINER dexterys@gmail.com

ENV HOME /root

RUN apt-get update --fix-missing&& apt-get -y install apt-utils && apt-get --no-install-recommends -y upgrade

#set locale
RUN apt-get install -y language-pack-ko
RUN locale-gen ko_KR.UTF-8

ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

# nginx-php installation
RUN apt-get -y install php7.0 
RUN apt-get -y install php7.0-fpm \
			php7.0-common \
			php7.0-cli \
			php7.0-mysqlnd \
			php7.0-mcrypt \
			php7.0-curl \
			php7.0-bcmath \
			php7.0-mbstring \
			php7.0-soap \
			php7.0-xml \
#			php7.0-zip \
			php7.0-json \
			php7.0-imap \
			php7.0-gd 
#			php-xdebug 

# install nginx
RUN apt-get install -y nginx-full


# install ETC
RUN apt-get install -y curl
RUN apt-get install -y git
#RUN apt-get install -y nodejs
#RUN apt-get install -y npm


# install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# copy files from repo
ADD build/nginx.conf /etc/nginx/sites-available/default
ADD build/.bashrc /root/.bashrc

# disable services start
RUN update-rc.d -f apache2 remove
RUN update-rc.d -f nginx remove
RUN update-rc.d -f php7.0-fpm remove


# add startup scripts for nginx
ADD build/nginx.sh /etc/service/nginx/run
RUN chmod +x /etc/service/nginx/run

# add startup scripts for php7.0-fpm
ADD build/phpfpm.sh /etc/service/phpfpm/run
RUN chmod +x /etc/service/phpfpm/run

# set terminal environment
#ENV TERM=xterm

# port and settings
EXPOSE 80 443

# cleanup apt and lists
RUN apt-get clean
RUN apt-get autoclean

# add build script (also set timezone to Asia/Seoul)
RUN mkdir -p /root/setup
ADD build/setup.sh /root/setup.sh
ADD build/index.php /root/setup/index.php
RUN chmod +x /root/setup.sh
#RUN (cd /root/setup/; /root/setup/setup.sh)

#VOLUME ["/data"]

#CMD ["/sbin/my_init"]
