
# package ['php', 'php-pdo','php-gd','php-mysql','php-fpm']  do
#   action :install
# end


# template node['wp']['path'] + '/wp-config.php' do
#   source 'wp-config.php.erb'
#   mode 0755
#   owner 'root'
#   group 'root' 
#   variables(
#     :database        => node['wp']['dbname'],
#     :user            => 'example_user',
#     :password        => node['wp']['dbpassword'],
#   )
#   not_if do
#     File.exists?(node['wp']['path'] + '/wp-config.php')
#   end
# end

template node['wordpress']['path'] + '/wp-config.php' do
  source 'wp-config.php.erb'
  mode 0755
  owner 'root'
  group 'root' 
  variables(
    :database        => node['wordpress']['dbname'],
    :user            => node['wordpress']['dbuser'],
    :password        => node['wordpress']['dbpassword'],
  )
  not_if do
    File.exists?(node['wordpress']['path'] + '/wp-config.php')
  end
end