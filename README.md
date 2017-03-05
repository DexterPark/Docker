# DexterPark-Docker
nginx, php7, composer, git 설치

#git
```
git clone https://github.com/DexterPark/Docker.git
```

#빌드전 확인사항
nodejs혹은 npm을 설치하시려면 Dockerfile내 #install ETC 에서 주석을 해재하여 주세요.
```
#RUN apt-get install -y nodejs
#RUN apt-get install -y npm
```

필요한 패키지를 골라서 추가하시거나 삭제(주석)처리 하세요.
```
RUN apt-get -y --force-yes install php7.0-fpm \
				   php7.0-common \
				   php7.0-cli \
				   php7.0-mysqlnd \
				   php7.0-mcrypt \
				   php7.0-curl \
				   php7.0-bcmath \
				   php7.0-mbstring \
				   php7.0-soap \
				   php7.0-xml \
#				   php7.0-zip \
				   php7.0-json \
				   php7.0-imap \
				   php7.0-gd 
#				   php-xdebug 
```

#빌드
```
docker build -t dexter-docker:latest .
docker run -d --name dexter-server -p 80:80 -p 443:443 -P  dexter-docker:latest
```

#Setup
컨테이너 생성 후 setup.sh를 실행하여 주세요. 
(컨테이너 생성후 1회만 실행하세요)

Shell 접속
```
docker exec -it dexter-server /bin/bash

```
setup.sh 실행
```
/root/setup.sh
```

운영에 필요한 파일들은 모두 /data 에 이동되어 관리됩니다.
```
    /data/www
    /data/etc
    /data/logs
```
Symlinks
```
    /var/www -> /data/www
    /etc/nginx -> /data/etc
    /var/log/nginx -> /data/logs
```



#Maintainer
Dexter Park <dexterys@gmail.com>
