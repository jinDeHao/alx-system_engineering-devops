#Execute a bash command
exec {
  'pkill':
  command   => 'pkill killmenow',
  provider  => 'shell'
}
