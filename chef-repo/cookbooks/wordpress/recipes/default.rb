user "www-data" do
  action :create
end

directory "/srv/www" do
  owner "root" 
  group "root"
  mode "0777"
  action :create
end

execute "get-wordpress" do
  command "wget https://wordpress.org/latest.tar.gz"
  cwd "/srv/www"
 # ignore_failure true
  end
 
  execute "tar-wordpress" do
    command "tar -xvf latest.tar.gz "
    cwd "/srv/www"
   # ignore_failure true
    end
  
  execute "tar-wordpress" do
     command "sudo rm -rf latest.tar.gz "
     cwd "/srv/www"
     # ignore_failure true
    end


  directory "/srv/www" do
   owner "www-data" 
   group "www-data"
   mode "0777"
   recursive true
  end

  directory "/srv/www/wordpress" do
    owner "www-data" 
    group "www-data"
    mode "0777"
    recursive true
   end

   execute "recursive permit" do
    command "sudo chown -R www-data:www-data wordpress/"
    cwd "/srv/www"
   # ignore_failure true
    end

    execute "recursive permit2" do
      command "sudo chmod -R 777 wordpress/"
      cwd "/srv/www"
     # ignore_failure true
      end


  template '/etc/apache2/sites-available/wordpress.conf' do
        source 'wordpress.conf'
        notifies :restart, resources(:service => "apache2")
      end


  execute "Enable the site" do
   command "sudo a2ensite wordpress"
   ignore_failure true
   end

   execute "Enable URL rewriting" do
    command "sudo a2enmod rewrite"
    ignore_failure true
    end


    execute "Disable the default" do
      command "sudo a2dissite 000-default"
      ignore_failure true
      end


     execute "Reload apache " do
       command "sudo service apache2 reload"
       ignore_failure true
       end



       template '/srv/www/wordpress/wp-config.php' do
        source 'wp-config.php'
        notifies :restart, resources(:service => "apache2")
      end


      execute "wordpress-usergrant" do
        command "mysql -u root -e  'GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO wordpress@localhost;'"
        ignore_failure true
        end

  include_recipe '::facts'