#!/usr/bin/env bats

source keystone-common.sh

# Neutron tests

@test "neutron-server process(es) running" {
  check_daemon_procs_multi neutron-server
}

@test "neutron-openvswitch-agent process(es) running" {
  check_daemon_procs_multi neutron-openvswitch-agent
}

@test "neutron-l3-agent process(es) running" {
  check_daemon_procs_multi neutron-l3-agent
}

@test "neutron-dhcp-agent process(es) running" {
  check_daemon_procs_multi neutron-dhcp-agent
}

@test "neutron-metadata-agent process(es) running" {
  check_daemon_procs_multi neutron-metadata-agent
}

@test "keystone user-get[neutron]" {
  keystone_user_get neutron
}

@test "keystone service-get[neutron]" {
  keystone_service_get neutron
}

@test "keystone endpoint-get[network]" {
  keystone_endpoint_get network
}
