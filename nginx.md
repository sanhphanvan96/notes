## SSL: nginx, Let's Encrypt, Docker
```sh
sudo yum update
sudo yum install certbot -y
sudo certbot certonly --standalone --email your-mail@mail.com --domains sub.domain.vn
#if any errors
sudo pip install --upgrade pip
sudo pip install requests==2.6.0
```

```
├── nginx
│   ├── certs
│   │   ├── fullchain.pem
│   │   └── privkey.pem
│   └── conf.d
│       ├── a-page_443.conf
│       └── a-page.conf
```

```docker
version: '3.1'

services:
 nginx:
   image: nginx:1.13
   container_name: a-page-nginx
   restart: always
   ports:
     - "80:80"
     - "443:443"
   volumes:
     - ./nginx/conf.d:/etc/nginx/conf.d
     - ./nginx/certs:/etc/nginx/certs
     - ./:/usr/share/code
```

```nginx
#a-page.conf
server {
    charset utf-8;
    client_max_body_size 128M;

    listen 80;

    server_name sub.domain.vn;

    return 301 https://$server_name$request_uri;
}

```

```nginx
#a-page_443.conf
server {
    charset utf-8;
    client_max_body_size 128M;

    listen 443;
    ssl on;
    ssl_certificate     /etc/nginx/certs/fullchain.pem;
    ssl_certificate_key /etc/nginx/certs/privkey.pem;

    #SSL Optimization
    ssl_session_timeout 1d;
    ssl_session_cache shared:SSL:20m;

    #Modern configuration
    ssl_protocols TLSv1.2;
    ssl_prefer_server_ciphers on;
    ssl_ciphers AES256+EECDH:AES256+EDH:AES128-SHA:AES256-SHA:AES128-SHA256:AES256-SHA256:!RC4:!DES-CBC3-SHA:!aNULL;

    server_name sub.domain.vn;
    root        /usr/share/code/;
    index       index.html;

    access_log  /var/log/nginx/access.log;
    error_log   /var/log/nginx/error.log;

    location ~* /\. {
        deny all;
    }
}
```
