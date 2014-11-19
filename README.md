Puppet
======

This will contain some nice Puppet files

Create a webistrano recipe, put this content into it:



# Recipe to install Puppet

namespace :deploy do

    desc ' Sets up shell script and puppet'

    task :setuplinks do
      #invoke 'puppet:repo:centos1'
      #sudo 'rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm'
      sudo "rm -f /etc/puppet"
      sudo "ln -s /opt/puppet_releases/current /etc/puppet"
    end

    task :createdir do
      sudo "mkdir -p /opt/puppet_releases"
      sudo "chown -R deploy /opt/puppet_releases"
    end

    task :runscript do
      sudo "/bin/bash /etc/puppet/bootstrap.sh"
    end
end

before('deploy', 'deploy:createdir');
after('deploy', 'deploy:setuplinks');
after('deploy:setuplinks', 'deploy:runscript');


