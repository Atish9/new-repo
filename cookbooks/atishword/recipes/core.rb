

remote_file '/tmp/wordpress.zip' do
  source 'https://wordpress.org/latest.zip'
  mode '0755'
  action :create_if_missing
end

execute 'Unzip wp package' do
 cwd '/tmp/'
 command 'unzip wordpress.zip'
 action :run
end

execute 'Copy WP package to /var/www/html' do
 command 'cp -fR /tmp/wordpress/. /var/www/html/'
 action :run
 not_if {File.exists?("/var/www/html/wp-config.php")}
end

directory '/var/www/html/wp-content/uploads' do
  owner 'apache'
  group 'apache'
  mode '0755'
  action :create
  not_if {File.exists?("/var/www/html/wp-content/uploads")}
end

# template '/var/www/html/wp-config.php' do
#   source 'wp-config.erb'
#   owner 'apache'
#   group 'apache'
#   mode '0755'
#   action :create
# end



file '/tmp/wordpress.zip' do
  action :delete
end

directory '/tmp/wordpress' do
  action :delete
  recursive true
end