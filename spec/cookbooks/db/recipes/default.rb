package 'mysql-server'

service 'mysql' do
  action :start
  supports :restart => true
end

cookbook_file '/etc/mysql/my.cnf' do
  notifies :restart, 'service[mysql]'
end

execute "mysql -uroot -e \"GRANT ALL PRIVILEGES ON *.* TO 'app'@'%' IDENTIFIED BY 'app';\""

