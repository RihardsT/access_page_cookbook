#
# Cookbook Name:: raspberry
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

log "Welcome to Chef, #{node["starter_name"]}!" do
  level :info
end

include_recipe 'apt'
include_recipe 'fail2ban'

package 'ruby'
package 'ruby-dev'
package 'build-essential'
package 'git'
package 'libsqlite3-dev'
package 'libsqlite3-dev'
package 'postgresql-server-dev-9.4'
package 'nodejs'

#Put this in a data bag this
# user 'chef' do
#   home '/home/chef'
#   password 'VLaQpFyqFgk88TkdCb8P4fK6'
# end
#
# group 'chef' do
#   members ['chef']
# end

# execute 'Set gem to not install documentation' do
#   command "echo 'gem: --no-document' >> ~/.gemrc"
# end
#
# execute 'Install bundler' do
#   command 'gem install bundler'
# end

ruby_gem 'bundler'
ruby_gem 'execjs'

include_recipe 'raspberry::access_page'
