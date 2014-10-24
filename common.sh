# Common test routines

PATH=$PATH:/usr/lib/nagios/plugins

export OS_AUTH_URL=${OS_AUTH_URL:=http://localhost:35357/v2.0}
export OS_TENANT_NAME=${OS_TENANT_NAME:=admin}
export OS_USERNAME=${OS_USERNAME:=admin}
export OS_PASSWORD=${OS_PASSWORD:=admin}

# Utilities

check_daemon_procs() {
  check_procs -a /usr/bin/$1 -c 1:1
}

check_daemon_procs_multi() {
  check_procs -a /usr/bin/$1 -c 1:
}
