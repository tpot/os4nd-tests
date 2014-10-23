# Common test routines

PATH=$PATH:/usr/lib/nagios/plugins

# Utilities

check_daemon_procs() {
  check_procs -a /usr/bin/$1 -c 1:1
}

check_daemon_procs_multi() {
  check_procs -a /usr/bin/$1 -c 1:
}
