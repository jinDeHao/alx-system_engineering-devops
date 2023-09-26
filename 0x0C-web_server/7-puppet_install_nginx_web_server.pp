# install nginx
package { 'nginx':
  ensure => installed,
}

# website index file
Nginx config
file { '/var/www/html/index.html':
  content => 'Hello World!',
}

# redirect_me config
# file_line { 'redirect_me':
#   ensure => present,
#   path   => '/home/omarnem/alx-system_engineering-devops/0x0C-web_server/file.me',
#   after  => 'server_name _;',
#   line   => '
#         location /redirect_me {
#             return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
#             # Am omar but you can call me dehao
#         }',
# }
file_line { 'redirect_me':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}


# stop nginx
exec { 'stop service':
  command => 'sudo service nginx stop',
  path    => ['/bin', '/usr/bin', '/usr/sbin'],
}

# run nginx
exec { 'start service':
  command => 'sudo service nginx start',
  path    => ['/bin', '/usr/bin', '/usr/sbin'],
}
