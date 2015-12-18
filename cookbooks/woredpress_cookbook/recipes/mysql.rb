

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



# bash "mysql_installation" do
#   code <<-EOH
#   mysql -e "update mysql.user set Password = Password('redhat') where User = 'root'"
#   mysql -e "drop user ''@'localhost'"
#   mysql -e "drop database test"
#   mysql -e "flush privileges"
#   EOH
# end


mysql_connection_info = {
  :host     => 'localhost',
  :username => 'root',
  :password => node.wordpress.mysql.rootpass
 }

mysql_database node.wordpress.mysql.dbname do
  connection  mysql_connection_info
  action      :create
end

mysql_database_user node.wordpress.mysql.dbname_username do
  connection      mysql_connection_info
  password        node.wordpress.mysql.dbname_userpass
  host            'localhost'
  database_name   node.wordpress.mysql.dbname
  action          :create
end

mysql_database_user node.wordpress.mysql.dbname_username do
  connection      mysql_connection_info
  database_name   node.wordpress.mysql.dbname
  privileges      [:all]    
require_ssl true
  action    :grant
end 



# connection_info = {
#     host:     site[:db][:hostname] || 'localhost',
#     username: 'root',
#     password: node[:mysql][:server_root_password]
#   }

#   mysql_database_user site[:db][:user] do
#     connection connection_info
#     password   site[:db][:pass]
#     action     :create
#   end

#   mysql_database site[:db][:name] do
#     connection connection_info
#     owner    site[:db][:user]
#     encoding 'utf8'
#     action   :create
#   end

#   mysql_database_user site[:db][:user] do
#     connection    connection_info
#     database_name site[:db][:name]
#     host          '%'
#     privileges    [:all]
#     action        :grant
#   end

# end