# SSH client configuration for a specific host

file_line { 'set SSH client options':
  path    => '~/.ssh/config',
  line    => '\tPasswordAuthentication no',
  ensure  => present,
}

file_line { 'add SSH IdentityFile':
  path    => '~/.ssh/config',
  line    => '\tIdentityFile ~/.ssh/school',
  ensure  => present,
}
