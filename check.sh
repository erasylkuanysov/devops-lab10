#!/usr/bin/env bash
set -u
{
  echo '=== OS ==='
  cat /etc/os-release
  echo '=== CPU ==='
  lscpu
  echo '=== RAM ==='
  free -h
  echo '=== DISK ==='
  df -h
  echo '=== KVM ==='
  if [ -e /dev/kvm ]; then
    ls -l /dev/kvm
  else
    echo '/dev/kvm unavailable'
  fi
  echo '=== VIRSH ==='
  if command -v virsh >/dev/null; then
    virsh list --all
  else
    echo 'virsh not installed'
  fi
} 2>&1 | tee results.txt
