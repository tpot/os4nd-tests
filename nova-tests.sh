#!/usr/bin/env bats

source keystone-common.sh

# Nova tests

@test "nova-conductor process(es) running" {
  check_daemon_procs_multi nova-conductor
}

@test "nova-scheduler process(es) running" {
  check_daemon_procs_multi nova-scheduler
}

@test "nova-api-os-compute process(es) running" {
  check_daemon_procs_multi nova-api-os-compute
}

@test "nova-cert process(es) running" {
  check_daemon_procs_multi nova-cert
}

@test "nova-novncproxy process(es) running" {
  check_daemon_procs_multi nova-novncproxy
}

@test "nova-consoleauth process(es) running" {
  check_daemon_procs_multi nova-consoleauth
}

@test "nova-api-metadata process(es) running" {
  check_daemon_procs_multi nova-api-metadata
}

@test "nova-compute process(es) running" {
  check_daemon_procs_multi nova-compute
}

@test "keystone user-get[nova]" {
  keystone_user_get nova
}

@test "keystone service-get[nova]" {
  keystone_service_get nova
}

@test "keystone endpoint-get[compute]" {
  keystone_endpoint_get compute
}

@test "nova list" {
  nova list
}

@test "nova flavor-list" {
  nova flavor-list
}

@test "nova keypair-list" {
  nova keypair-list
}

@test "nova image-list" {
  nova image-list
}
