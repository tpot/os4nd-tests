#!/usr/bin/env bats

source keystone-common.sh

# Glance tests

@test "glance-api process(es) running" {
  check_daemon_procs_multi glance-api
}

@test "glance-registry process(es) running" {
  check_daemon_procs_multi glance-registry
}

@test "keystone user-get[glance]" {
  keystone_user_get glance
}

@test "keystone service-get[glance]" {
  keystone_service_get glance
}

@test "keystone endpoint-get[image]" {
  keystone_endpoint_get image
}

@test "glance image-show[cirros]" {
  glance --os-auth-url http://localhost:35357/v2.0 --os-tenant-name admin --os-username admin --os-password admin image-show cirros
}
