# Web infrastructure design

## First task
    1 server
    1 web server (Nginx)
    1 application server
    1 application files (your code base)
    1 database (MySQL)
    1 domain name foobar.com configured with a www record that points to your server IP 8.8.8.8
**link :**
    https://imgur.com/yRt2d1s

## Second task
    2 servers
    1 web server (Nginx)
    1 application server
    1 load-balancer (HAproxy)
    1 set of application files (your code base)
    1 database (MySQL)
**link :**
    https://imgur.com/zGQaEqb

## Third task
    3 firewalls
    1 SSL certificate to serve www.foobar.com over HTTPS
    3 monitoring clients (data collector for Sumologic or other monitoring services)
**link :**
    https://imgur.com/oI0ZXfD

## Fourth Task
    1 server
    1 load-balancer (HAproxy) configured as cluster with the other one
    Split components (web server, application server, database) with their own server
**link :**
    
