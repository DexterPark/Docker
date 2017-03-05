# DexterPark-Docker
nginx, php7, composer, git ��ġ

#git
```
git clone https://github.com/DexterPark/Docker.git
```

#������ Ȯ�λ���
nodejsȤ�� npm�� ��ġ�Ͻ÷��� Dockerfile�� #install ETC ���� �ּ��� �����Ͽ� �ּ���.
```
#RUN apt-get install -y nodejs
#RUN apt-get install -y npm
```

�ʿ��� ��Ű���� ��� �߰��Ͻðų� ����(�ּ�)ó�� �ϼ���.
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

#����
```
docker build -t dexter-docker:latest .
docker run -d --name dexter-server -p 80:80 -p 443:443 -P  dexter-docker:latest
```

#Setup
�����̳� ���� �� setup.sh�� �����Ͽ� �ּ���. 
(�����̳� ������ 1ȸ�� �����ϼ���)

Shell ����
```
docker exec -it dexter-server /bin/bash

```
setup.sh ����
```
/root/setup.sh
```

��� �ʿ��� ���ϵ��� ��� /data �� �̵��Ǿ� �����˴ϴ�.
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
