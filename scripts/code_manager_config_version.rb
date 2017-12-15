#!/usr/bin/env ruby
require 'json'

environmentpath = ARGV[0]
environment     = ARGV[1]

# Get the hostname of the Puppet master compiling the catalog.
# Sometimes the hostname is the fqdn, so we'll take the first segment.
compiling_master = Socket.gethostname.split('.').first

# Get the path to the Code Manager deployment info file.
r10k_deploy_file_path = File.join(environmentpath, environment, '.r10k-deploy.json')

#output the sha1 from the control-repo
puts JSON.parse(File.read(r10k_deploy_file_path))['signature']
