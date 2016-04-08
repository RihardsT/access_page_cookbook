directory '/srv' do
  user 'vagrant'
  group 'vagrant'
  mode '0755'
end

execute 'Pull access_page repository' do
  command 'cd /srv/access_page; git pull origin develop'
  user 'vagrant'
  group 'vagrant'
  only_if { ::File.directory?("/srv/access_page/") }
end

execute 'Clone access_page repository' do
  command 'cd /srv; git clone https://github.com/RihardsT/access_page.git -b develop'
  user 'vagrant'
  group 'vagrant'
  not_if { ::File.directory?("/srv/access_page/") }
end

application '/srv/access_page' do
  # git 'https://github.com/RihardsT/access_page.git' do
  #   checkout_branch 'develop'
  # end
  bundle_install do
    deployment false
    # without %w{development test}
    user 'vagrant'
  end
  rails do
    database 'sqlite3:///db.sqlite3'
    secret_token 'd78fe08df56c9'
    precompile_assets false
    migrate true
  end
  # ruby_execute 'rake db:seed'
  unicorn do
    port 80
  end
end
