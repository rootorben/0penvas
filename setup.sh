sudo apt-get install libmicrohttpd-dev libxml2-dev xsltproc libxslt1-dev pkg-config flex cmake libssh-dev sqlite3 libsqlite3-dev libgnutls28-dev libgcrypt11-dev libglib2.0-dev libpcap-dev libgpgme11-dev uuid-dev bison libksba-dev nmap rpm;
mkdir openvas && cd openvas;
wget http://wald.intevation.org/frs/download.php/1303/openvas-libraries-6.0.0.tar.gz;
wget http://wald.intevation.org/frs/download.php/1307/openvas-scanner-3.4.0.tar.gz;
wget http://wald.intevation.org/frs/download.php/1381/openvas-manager-4.0.2.tar.gz;
wget http://wald.intevation.org/frs/download.php/1319/openvas-administrator-1.3.0.tar.gz;
wget http://wald.intevation.org/frs/download.php/1335/greenbone-security-assistant-4.0.1.tar.gz;
tar xvzf openvas-libraries-6.0.0.tar.gz;
tar xvzf openvas-scanner-3.4.0.tar.gz;
tar xvzf openvas-manager-4.0.2.tar.gz;
tar xvzf openvas-administrator-1.3.0.tar.gz;
tar xvzf greenbone-security-assistant-4.0.1.tar.gz;
cd openvas-libraries-6.0.0;
mkdir build && cd build && sudo cmake .. && sudo make && sudo make install && sudo make rebuild_cache && sudo make install && cd ..;
cd ..;
cd openvas-scanner-3.4.0;
mkdir build && cd build && sudo cmake .. && sudo make && sudo make install && sudo make rebuild_cache && sudo make install && cd ..;
cd ..;
cd openvas-manager-4.0.2;
mkdir build && cd build && sudo cmake .. && sudo make && sudo make install && sudo make rebuild_cache && sudo make install && cd ..;
cd ..;
cd openvas-administrator-1.3.0;
mkdir build && cd build && sudo cmake .. && sudo make && sudo make install && sudo make rebuild_cache && sudo make install && cd ..;
cd ..
cd greenbone-security-assistant-4.0.1
mkdir build && cd build && sudo cmake .. && sudo make && sudo make install && sudo make rebuild_cache && sudo make install && cd ..;
cd ..
openvas-mkcert
openvas-mkcert-client -n om -i
//Add a user, follow the instructions
openvasad -c 'add_user' -n administrator -r Admin
//Get latest definitions
openvas-nvt-sync
//Start the daemon (this will take a sh*t long time so go watch a movie)
openvassd
//Rebuild the database (this will also take a sh*t long time so go watch another movie, this part doesn't give any feedback so it looks like it's frozen but let it do it's thing)
openvasmd --rebuild
//Update the database
openvasmd --update
//Migrate the database
openvasmd --migrate
//Rebuild the database again
openvasmd --rebuild
//Make some other database
openvas-scapdata-sync
//Synchronize certificate
openvas-certdata-sync

//Or if instead of watching movies you could do:
openvassd && openvasmd --rebuild && openvasmd --update && openvasmd --migrate && openvasmd --rebuild && openvas-scapdata-sync && openvas-certdata-sync
//And while that runs you go take a nap or watch a whole season of The Walking Dead

//Run the manager
openvasmd -p 9390 -a 127.0.0.1
//Run the administrator
openvasad -a 127.0.0.1 -p 9393
//Run the web back end
gsad --http-only -p 9392

wget --no-check-certificate https://svn.wald.intevation.org/svn/openvas/trunk/tools/openvas-check-setup
chmod +x openvas-check-setup
./openvas-check-setup --server

//Run the scanner
openvassd
//Run the manager
openvasmd -p 9390 -a 127.0.0.1
//Run the administrator
openvasad -a 127.0.0.1 -p 9393
//Run the web back end
gsad --http-only -p 9392
