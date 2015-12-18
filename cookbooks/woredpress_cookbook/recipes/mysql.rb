

mysql2_chef_gem 'default' do
  action :install
end

# package "mysql-community-server" do
#   action :install
# end

 yum_package "mysql-server" do
 action :install
end

service "mysqld" do
  action [:start, :enable]
end

mysql_database node['wordpress']['dbname'] do
  connection(
    :host => node['wordpress']['host'],
    :username => node['wordpress']['username']
  )
  action :create
end

mysql_connection_info = {:host => "127.0.0.1",
                         :username => 'root'}

database_user node['wordpress']['dbuser'] do
  connection mysql_connection_info
  password node['wordpress']['dbpassword']
  provider Chef::Provider::Database::MysqlUser
  action :create
end

mysql_database_user node['wordpress']['dbuser'] do
  connection mysql_connection_info
  password node['wordpress']['dbpassword']
   privileges      [:all]
  action :grant
end


# ========================================================================================================











# # bash "mysql_installation" do
# #   code <<-EOH
# #   mysql -e "update mysql.user set Password = Password('redhat') where User = 'root'"
# #   mysql -e "drop user ''@'localhost'"
# #   mysql -e "drop database test"
# #   mysql -e "flush privileges"
# #   EOH
# # end


# # mysql_connection_info = {
# #   :host     => 'localhost',
# #   :username => 'root',
# #   :password => node.wordpress.mysql.rootpass
# #  }

# # mysql_database node.wordpress.mysql.dbname do
# #   connection  mysql_connection_info
# #   action      :create
# # end

# # mysql_database_user node.wordpress.mysql.dbname_username do
# #   connection      mysql_connection_info
# #   password        node.wordpress.mysql.dbname_userpass
# #   host            'localhost'
# #   database_name   node.wordpress.mysql.dbname
# #   action          :create
# # end

# # mysql_database_user node.wordpress.mysql.dbname_username do
# #   connection      mysql_connection_info
# #   database_name   node.wordpress.mysql.dbname
# #   privileges      [:all]    
# # require_ssl true
# #   action    :grant
# # end 



# mysql_database node['wp']['dbname'] do
#   connection(
#     :host => node['wp']['host'],
#     :username => node['wp']['username']
#   )
#   action :create
# end

# mysql_connection_info = {:host => "127.0.0.1",
#                          :username => 'root'}

# database_user node['wp']['dbuser'] do
#   connection mysql_connection_info
#   password node['wp']['dbpassword']
#   provider Chef::Provider::Database::MysqlUser
#   action :create
# end

# mysql_database_user node['wp']['dbuser'] do
#   connection mysql_connection_info
#   password node['wp']['dbpassword']
#    privileges      [:all]
#   action :grant
# end