  package 'mysql-server'
  package 'mysql-client'
    
   service 'mysql' do
     supports :status => true
     action :nothing
   end
  
   execute "wordpress-createdb" do
    command "mysqladmin -u root  create wordpress"
    ignore_failure true
    end

   execute "wordpress-createuser" do
      command "mysql -u root -e  'CREATE USER wordpres@localhost;' "
      ignore_failure true
      end


      file "/home/vagrant/wordpress.sql" do
        owner "root" 
        group "root"
        mode "0777"
        action :create
      end

      template '/home/vagrant/wordpress.sql' do
      source 'wordpress.sql'
      end


      file "/home/vagrant/mysql.sql" do
       owner "root" 
       group "root"
       mode "0777"
      action :create
      end

   template '/home/vagrant/mysql.sql' do
     source 'mysql.sql'
     end
      
    execute "wordpress-data-base" do
      command "sudo mysql -u root wordpress < /home/vagrant/wordpress.sql"
      #ignore_failure true
      end

    execute "mysql-data-base" do
        command "sudo mysql -u root mysql < /home/vagrant/mysql.sql"
       # ignore_failure true
        end

   