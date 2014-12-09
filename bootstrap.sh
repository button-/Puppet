#!/bin/bash
# Bootstrap file to setup Puppet

CENTOS_RELEASE=`rpm -q --queryformat "%{VERSION}" centos-release`

if [ $CENTOS_RELEASE = "6" ] || [ $CENTOS_RELEASE = "7" ] ; then
  echo "$CENTOS_RELEASE"
  sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-$CENTOS_RELEASE.noarch.rpm
  yum -y install puppet
else
  echo "Could not detect version of CentOS: $CENTOS_RELEASE"
  exit 1
fi

