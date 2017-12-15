#!/opt/puppetlabs/puppet/bin/ruby
begin
  require 'rugged'
rescue LoadError => e
  t = Time.new
  puts t.to_i
else

  environmentpath = ARGV[0]
  environment     = ARGV[1]

  # Get the hostname of the Puppet master compiling the catalog.
  # Sometimes the hostname is the fqdn, so we'll take the first segment.
  compiling_master = Socket.gethostname.split('.').first

  # Get the path to the environment being compiled.
  repo = Rugged::Repository.discover(File.join(environmentpath, environment))
  head  = repo.head

  #sha1 hash of the newest commit
  head_sha = head.target_id

  #the commit message associated the newest commit
  commit = repo.lookup(head_sha)

  #add something to find the remote url

  puts head_sha 
end
