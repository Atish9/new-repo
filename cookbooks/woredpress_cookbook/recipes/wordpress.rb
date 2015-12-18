

Chef::Config[:file_cache_path]

remote_file "/#{Chef::Config[:file_cache_path]}/wordpress.zip" do
        source "https://wordpress.org/latest.zip"
        action :create_if_missing
  end

  execute 'Unzip wp package' do
 cwd "/#{Chef::Config[:file_cache_path]}"
 command 'unzip wordpress.zip'
 action :run
end

execute 'Copy WP package to /var/www/html' do
 command "cp -fR /#{Chef::Config[:file_cache_path]}/wordpress/. /var/www/html/"
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


file "/#{Chef::Config[:file_cache_path]}/tmp/wordpress.zip" do
  action :delete
end

directory "/#{Chef::Config[:file_cache_path]}/wordpress" do
  action :delete
  recursive true
end






# Chef::Config[:file_cache_path]

# remote_file "/#{Chef::Config[:file_cache_path]}/latest.tar.gz" do
#         source "http://wordpress.org/latest.tar.gz"
#         action :create_if_missing
#   end

# bash "extract_wordpress" do
#   cwd "/#{Chef::Config[:file_cache_path]}"
#   code <<-EOH
#   tar -xzvf latest.tar.gz -C /var/www/html/
#   chown -R apache:apache /var/www/html/wordpress
#   mkdir -p /var/www/html/wordpress/wp-content/uploads
#   chown -R :apache /var/www/html/wordpress/wp-content/uploads
#   EOH
# end



