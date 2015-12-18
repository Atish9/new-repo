
package ['php', 'php-pdo','php-mysql','php-fpm']  do
  action :install
end

# template node['wp']['destination'] + '/wp-config.php' do
#   source 'wp-config.php.erb'
#   mode 0755
#   owner 'root'
#   group 'root' 
#   # variables(
#   #   :database        => node,
#   #   :user            => 'root',
#   #   :password        => 'redhat',
#   # )
#   # not_if do
#   #   File.exists?(node['wp']['destination'] + '/wp-config.php')
#   # end
# end