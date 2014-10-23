#!/usr/bin/env bats

source keystone-common.sh

# Cinder tests

@test "cinder-api process(es) running" {
  check_daemon_procs_multi cinder-api
}

@test "cinder-scheduler process(es) running" {
  check_daemon_procs_multi cinder-scheduler
}

@test "cinder-volume process(es) running" {
  check_daemon_procs_multi cinder-volume
}

@test "keystone user-get[cinder]" {
  keystone_user_get cinder
}

@test "keystone service-get[cinder]" {
  keystone_service_get cinder
}

@test "keystone endpoint-get[volume]" {
  keystone_endpoint_get volume
}
