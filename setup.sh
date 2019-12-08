sudo apt-get install make cmake autoconf gnutls libxslt xsltproc libopenvas automake libmicrohttpd-dev libxml2-dev xsltproc libxslt1-dev pkg-config flex cmake libssh-dev sqlite3 libsqlite3-dev libgnutls28-dev libgcrypt11-dev libglib2.0-dev libpcap-dev libgpgme11-dev uuid-dev bison libksba-dev nmap rpm;
cd /usr/share && sudo mkdir openvas && cd openvas;
sudo wget http://wald.intevation.org/frs/download.php/1303/openvas-libraries-6.0.0.tar.gz;
sudo wget http://wald.intevation.org/frs/download.php/1307/openvas-scanner-3.4.0.tar.gz;
sudo wget http://wald.intevation.org/frs/download.php/1381/openvas-manager-4.0.2.tar.gz;
sudo wget http://wald.intevation.org/frs/download.php/1319/openvas-administrator-1.3.0.tar.gz;
sudo wget http://wald.intevation.org/frs/download.php/1335/greenbone-security-assistant-4.0.1.tar.gz;
sudo tar xvzf openvas-libraries-6.0.0.tar.gz;
sudo tar xvzf openvas-scanner-3.4.0.tar.gz;
sudo tar xvzf openvas-manager-4.0.2.tar.gz;
sudo tar xvzf openvas-administrator-1.3.0.tar.gz;
sudo tar xvzf greenbone-security-assistant-4.0.1.tar.gz;
sudo rm -rf *.tar.gz;
cd openvas-libraries-6.0.0;
sudo mkdir build;
cd build;
sudo cmake ..; 
sudo make;
sudo make install;
sudo make rebuild_cache;
sudo make install;
cd /usr/share/openvas/openvas-scanner-3.4.0;
sudo mkdir build;
cd build;
sudo cmake ..;
sudo make;
sudo make install;
sudo make rebuild_cache;
sudo make install;
cd /usr/share/openvas/openvas-manager-4.0.2;
sudo mkdir build;
cd build;
sudo cmake ..;
sudo make;
sudo make install;
sudo make rebuild_cache;
sudo make install;
cd /usr/share/openvas/openvas-administrator-1.3.0;
sudo mkdir build;
cd build;
sudo cmake ..;
sudo make;
sudo make install;
sudo make rebuild_cache;
sudo make install;
cd /usr/share/openvas/greenbone-security-assistant-4.0.1
sudo mkdir build;
cd build;
sudo cmake ..;
sudo make;
sudo make install;
sudo make rebuild_cache;
sudo make install;
cd;
# sudo openvas-mkcert;
# sudo openvas-mkcert-client -n om -i
# Add a user, follow the instructions
# openvasad -c 'add_user' -n administrator -r Admin
# Get latest definitions
# sudo openvas-nvt-sync
# Start the daemon (this will take a sh*t long time so go watch a movie)
# sudo openvassd
# Rebuild the database (this will also take a sh*t long time so go watch another movie, this part doesn't give any feedback so it looks like it's frozen but let it do it's thing)
# sudo openvasmd --rebuild
# Update the database
# openvasmd --update
# Migrate the database
# sudo openvasmd --migrate
# Rebuild the database again
# sudo openvasmd --rebuild
# Make some other database
# sudo openvas-scapdata-sync
# Synchronize certificate
# sudo openvas-certdata-sync

# Or
# sudo openvassd && sudo openvasmd --rebuild && sudo openvasmd --update && sudo openvasmd --migrate && sudo openvasmd --rebuild && sudo openvas-scapdata-sync && sudo openvas-certdata-sync

# Run the scanner
# sudo openvassd
# Run the manager
# sudo openvasmd -p 9390 -a 127.0.0.1
# Run the administrator
# sudo openvasad -a 127.0.0.1 -p 9393
# Run the web back end
# sudo gsad --http-only -p 9392

# Get Check-SetUp
# wget --no-check-certificate https://svn.wald.intevation.org/svn/openvas/trunk/tools/openvas-check-setup;
# chmod +x openvas-check-setup;
# sudo ./openvas-check-setup --server
