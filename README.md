Step 1:   Install VirtualBox

Step 2:   Install Vagrant

Step 2.5 (if required):  Download Ubuntu Precise32 Box by the following command:
  
  vagrant box add precise32 http://files.vagrantup.com/precise32.box

Step 3:   clone git repository : git clone https://github.com/mauriciovander/VagrantVM1.git

Step 4:   cd into de new VagrantVM1 folder and execute "vagrant up" (takes about 10 minutes)

Step 5:   wait for the VM instalation to complete and start using it.

Host folder www is syncronized with /var/www in the VM environment
Other sync-folders are:

  www --> /var/www
  
  virtual-hosts --> /et/apache2/conf.d
  
  php-config-files --> /usr/share/php5

./db.sh will access the VM hosted MySQL database with root privileges

Configure your Apache VirtualHosts as if you were in the VM environment and configure your local DNS to point your local sites to 12.0.1.20.
(Yoy can change the IP in VagrantFile to whatever you like)

To access VM using 

~ vagrant ssh

~ sudo ./postinstall.sh   (can take about 10 extra minutes)

from the VM, execute sudo service apache2 restart every time you add or change a VirtualHost 

Enjoy !
