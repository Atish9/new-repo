
# package ['php', 'php-gd', 'php-pdo','php-mysql','php-fpm']  do
#   action :install
# end

# template node[:wp][:destination][:path] + '/wp-config.php' do
#   source 'wp-config.php.erb'
#   mode 0755
#   owner 'root'
#   group 'root' 
#   variables(
#     :database        => node[:wp][:database][:dbname],
#     :user            => node[:wp][:database][:dbuser],
#     :password        => node[:wp][:database][:dbpassword],
#   )
#   not_if do
#     File.exists?(node[:wp][:destination][:path] + '/wp-config.php')
#   end
# end


# template node['wordpress']['path'] + '/wp-config.php' do
#   source 'wp-config.php.erb'
#   mode 0755
#   owner 'root'
#   group 'root' 
#   variables(
#     :database        => node['wordpress']['database'],
#     :user            => 'root',
#     :password        => node['mysql']['server_root_password'],
#   )
#   not_if do
#     File.exists?(node['wordpress']['path'] + '/wp-config.php')
#   end
# end

template '/var/www/html/wp-config.php' do
  source 'wp-config.erb'
  owner 'apache'
  group 'apache'
  mode '0755'
  action :create
end
