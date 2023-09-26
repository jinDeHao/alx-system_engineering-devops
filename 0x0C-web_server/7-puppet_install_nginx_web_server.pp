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
file_line { 'redirect_me':
  ensure => present,
  path   => '/home/omarnem/alx-system_engineering-devops/0x0C-web_server/file.me',
  after  => 'server_name _;',
  line   => '
        location /redirect_me {
            return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
            # Am omar but you can call me dehao
        }',
}


# run nginx
exec { 'restart service':
  command => 'sudo service nginx restart',
  path    => ['/bin', '/usr/bin'],
}
