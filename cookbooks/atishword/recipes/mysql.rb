yum_package "mysql-server" do
 action :install
end

service "mysqld" do
  action [:start, :enable]
end



mysql2_chef_gem 'default' do
  action :install
end


# bash "mysql_installation" do
#   code <<-EOH
#   mysql -e "update mysql.user set Password = Password('redhat') where User = 'root'"
#   mysql -e "drop user ''@'localhost'"
#   mysql -e "drop database test"
#   mysql -e "flush privileges"
#   EOH
# end


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
   privileges      [:all] 
  action :grant
end