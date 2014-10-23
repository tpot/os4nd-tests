#!/usr/bin/env bats

source keystone-common.sh

# Keytone tests

@test "keystone-all process running"  {
  check_daemon_procs keystone-all
}

@test "keystone tenant-get admin" {
  keystone_tenant_get admin
}

@test "keystone tenant-get service" {
  keystone_tenant_get service
}

@test "keystone user-get[admin]" {
  keystone_user_get admin
}

@test "keystone token-get[admin]" {
  keystone --os-auth-url http://localhost:35357/v2.0 --os-tenant-name admin --os-username admin --os-password admin token-get
}

@test "keystone service-get[keystone]" {
  keystone_service_get keystone
}

@test "keystone endpoint-get[identity]" {
  keystone_endpoint_get identity
}
