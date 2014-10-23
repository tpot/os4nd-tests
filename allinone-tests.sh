#!/usr/bin/env bats

PATH=$PATH:/usr/lib/nagios/plugins

# Utilities

check_daemon_procs() {
  check_procs -a /usr/bin/$1 -c 1:1
}

check_daemon_procs_multi() {
  check_procs -a /usr/bin/$1 -c 1:
}

# Infrastructure

@test "mysqld process running" {
  check_procs -C mysqld -c 1:1
}

# Keytone tests

@test "keystone-all process running"  {
  check_daemon_procs keystone-all
}

keystone_tenant_get() {
  keystone --os-token openstack_identity_bootstrap_token --os-endpoint http://localhost:35357/v2.0 tenant-get $1
}

keystone_service_get() {
  keystone --os-token openstack_identity_bootstrap_token --os-endpoint http://localhost:35357/v2.0 service-get $1
}

@test "keystone tenant-get admin" {
  keystone_tenant_get admin
}

@test "keystone tenant-get service" {
  keystone_tenant_get service
}

keystone_user_get() {
  keystone --os-token openstack_identity_bootstrap_token --os-endpoint http://localhost:35357/v2.0 user-get $1
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

keystone_endpoint_get() {
  keystone --os-auth-url http://localhost:35357/v2.0 --os-tenant-name admin --os-username admin --os-password admin endpoint-get --service $1
}

@test "keystone endpoint-get[identity]" {
  keystone_endpoint_get identity
}

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
  nova --os-auth-url http://localhost:35357/v2.0 --os-tenant-name admin --os-username admin --os-password admin list
}

@test "nova flavor-list" {
  nova --os-auth-url http://localhost:35357/v2.0 --os-tenant-name admin --os-username admin --os-password admin flavor-list
}

@test "nova keypair-list" {
  nova --os-auth-url http://localhost:35357/v2.0 --os-tenant-name admin --os-username admin --os-password admin keypair-list
}

@test "nova image-list" {
  nova --os-auth-url http://localhost:35357/v2.0 --os-tenant-name admin --os-username admin --os-password admin image-list
}

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
