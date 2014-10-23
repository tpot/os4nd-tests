#!/usr/bin/env bats

source common.sh

# Infrastructure

@test "mysqld process running" {
  check_procs -C mysqld -c 1:1
}
