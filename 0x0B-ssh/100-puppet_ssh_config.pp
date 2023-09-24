# SSH client configuration for a specific host

file_line { 'set SSH client options':
	path    => '/etc/ssh/ssh_config',
	line    => '\tPasswordAuthentication no',
	ensure  => present,
}

file_line { 'add SSH IdentityFile':
	path    => '/etc/ssh/ssh_config',
	line    => '\tIdentityFile ~/.ssh/school',
	ensure  => present,
}
