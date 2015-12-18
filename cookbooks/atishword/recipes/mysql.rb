yum_package "mysql-server" do
 action :install
end

service "mysqld" do
  action [:start, :enable]
end



mysql2_chef_gem 'default' do
  action :install
end

mysql_database node['wp']['database']['dbname'] do
  connection(
    :host => node['wp']['database']['host'],
    :username => node['wp']['database']['username']
  )
  action :create
end

mysql_connection_info = {:host => "127.0.0.1",
                         :username => 'root'}

database_user node['wp']['database']['dbuser'] do
  connection mysql_connection_info
  password node['wp']['database']['dbpassword']
  provider Chef::Provider::Database::MysqlUser
  action :create
end

mysql_database_user node['wp']['database']['dbuser'] do
  connection mysql_connection_info
  password node['wp']['database']['dbpassword']
  action :grant
end