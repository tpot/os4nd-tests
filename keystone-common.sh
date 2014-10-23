#!/usr/bin/env bats

source common.sh

keystone_tenant_get() {
  keystone --os-token openstack_identity_bootstrap_token --os-endpoint http://localhost:35357/v2.0 tenant-get $1
}

keystone_service_get() {
  keystone --os-token openstack_identity_bootstrap_token --os-endpoint http://localhost:35357/v2.0 service-get $1
}

keystone_user_get() {
  keystone --os-token openstack_identity_bootstrap_token --os-endpoint http://localhost:35357/v2.0 user-get $1
}

keystone_endpoint_get() {
  keystone --os-auth-url http://localhost:35357/v2.0 --os-tenant-name admin --os-username admin --os-password admin endpoint-get --service $1
}
