apt_update 'Update the apt cache daily' do
    frequency 86400
    action :periodic
  end
  

  execute "php-dependencies1" do
    command "apt-get install -y ghostscript"
    ignore_failure true
    end
  
    execute "php-dependencies2" do
      command "apt-get install -y libapache2-mod-php"
      ignore_failure true
      end
  
    execute "php-dependencies3" do
      command "apt-get install -y php "
      ignore_failure true
      end

    execute "php-dependencies4" do
      command "apt-get install -y php-curl"
        ignore_failure true
        end
         
    execute "php-dependencies5" do
        command "apt-get install -y php-imagick"
        ignore_failure true
        end

    execute "php-dependencies6" do
      command "apt-get install -y php-intl"
      ignore_failure true
      end
            
    execute "php-dependencies7" do
     command "apt-get install -y php-json"
     ignore_failure true
     end

    #  execute "createdbsmysql" do
    #   command "touch mysql.sql"
    #   ignore_failure true
    #   end
 
    #  execute "createdbswordpress" do
    #   command "touch wordpress.sql"
    #   ignore_failure true
    #   end

  package 'apache2'
  
  service 'apache2' do
    supports :status => true
    action :nothing
  end
  
  file '/etc/apache2/sites-enabled/000-default.conf' do
    action :delete
  end
  
  template '/etc/apache2/sites-available/vagrant.conf' do
    source 'virtual-hosts.conf.erb'
    notifies :restart, resources(:service => "apache2")
  end
  
  link '/etc/apache2/sites-enabled/vagrant.conf' do
    to '/etc/apache2/sites-available/vagrant.conf'
    notifies :restart, resources(:service => "apache2")
  end
  
  cookbook_file "#{node['apache']['document_root']}/index.html" do
    source 'index.html'
    only_if do
      File.exist?('/etc/apache2/sites-enabled/vagrant.conf')
    end
  end

 include_recipe '::facts'

  