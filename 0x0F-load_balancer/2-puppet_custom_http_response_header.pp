#!/usr/bin/env bash
# custom header using puppet

exec { 'update server':
  command  => 'sudo apt -y update',
  path     => ['/bin', '/usr/bin', '/usr/sbin'],
}
->
exec { 'upgrade server':
  command  => 'sudo apt -y upgrade',
  path    => ['/bin', '/usr/bin', '/usr/sbin'],
}
->
package { 'nginx':
  ensure   => installed,
}
->
file_line { 'add custom header':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  after   => 'listen 80 default_server;',
  line    => 'add_header X-Served-By $HOSTNAME;'
}
->
exec { 'nginx':
  command  => 'sudo service nginx restart',
  path     => ['/bin', '/usr/bin', '/usr/sbin'],
}
