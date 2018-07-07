# Install for Kali
## [Adding a new user in Kali Linux](https://www.linkedin.com/pulse/20140502074357-79939846-adding-a-new-user-in-kali-linux)

```
useradd -m username

passwd username

usermod -a -G sudo username

chsh -s /bin/bash username
```
## [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh)

```sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"```

## [Install Docker](https://www.ptrace-security.com/2017/06/14/hackontuesday-episode-7-how-to-install-docker-on-kali-linux-2017-1/)

## [Install Docker Compose](https://docs.docker.com/compose/install/)

```
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## [Install Visual Studio Code](https://code.visualstudio.com/docs/setup/linux#_installation)

```
sudo dpkg -i <file>.deb
sudo apt-get install -f # Install dependencies
```

## [Install Maven](http://www.baeldung.com/install-maven-on-windows-linux-mac)

## [Install lastest Sublime](http://docs.sublimetext.info/en/latest/getting_started/install.html)

```
cd ~
wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb
```
- Key
```
----- BEGIN LICENSE -----
Member J2TeaM
Single User License
EA7E-1011316
D7DA350E 1B8B0760 972F8B60 F3E64036
B9B4E234 F356F38F 0AD1E3B7 0E9C5FAD
FA0A2ABE 25F65BD8 D51458E5 3923CE80
87428428 79079A01 AA69F319 A1AF29A4
A684C2DC 0B1583D4 19CBD290 217618CD
5653E0A0 BACE3948 BB2EE45E 422D2C87
DD9AF44B 99C49590 D2DBDEE1 75860FD2
8C8BB2AD B2ECE5A4 EFC08AF2 25A9B864
------ END LICENSE ------
```
## Add application to dash (launch icon)
```
sudo vim /usr/share/applications/intellij.desktop
```
- Add these lines
```
[Desktop Entry]
Version=13.0
Type=Application
Terminal=false
Icon[en_US]=/home/rob/.intellij-13/bin/idea.png
Name[en_US]=IntelliJ
Exec=/home/rob/.intellij-13/bin/idea.sh
Name=IntelliJ
Icon=/home/rob/.intellij-13/bin/idea.png
```
## [Install NodeJS](https://nodejs.org/en/download/package-manager/)

```
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
```
- To install the Yarn package manager, run:

```
     curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
     echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
     sudo apt-get update && sudo apt-get install yarn
```
## [Git on the Server - Generating Your SSH Public Key](https://help.github.com/articles/connecting-to-github-with-ssh/)

- Check to see if you have a key already by going to that directory and listing the contents
```
$ cd ~/.ssh
$ ls
authorized_keys2  id_dsa       known_hosts
config            id_dsa.pub
```
- Generate SSH key
```
$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/sanhpv/.ssh/id_rsa):
Created directory '/home/sanhpv/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/sanhpv/.ssh/id_rsa.
Your public key has been saved in /home/sanhpv/.ssh/id_rsa.pub.
The key fingerprint is:
d0:82:24:8e:d7:f1:bb:9b:33:53:96:93:49:da:9b:e3 sanhpv@me.com
```
- The public keys look something like this
```
$ cat ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAklOUpkDHrfHY17SbrmTIpNLTGK9Tjom/BWDSU
GPl+nafzlHDTYW7hdI4yZ5ew18JH4JW9jbhUFrviQzM7xlELEVf4h9lFX5QVkbPppSwg0cda3
Pbv7kOdJ/MTyBlWXFCR+HAo3FXRitBqxiX1nKhXpHAZsMciLq8V6RjsNAQwdsdMFvSlVK/7XA
t3FaoJoAsncM1Q9x5+3V0Ww68/eIFmb1zuUFljQJKprrX88XypNDvjYNby6vw/Pb0rwert/En
mZ+AW4OZPnTPI89ZPmVMLuayrD2cE86Z/il8b+gw3r3+1nKatmIkjn2so1d01QraTlMqVSsbx
NrRFi9wrf+M7Q== sanhpv@me.com
```
- [Add this key to Github account](https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/)

## Install Atom
```
    curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
    sudo apt-get update
    sudo apt-get install atom
```

# Error

## 1. Cannot use apt-get 

```
E: Could not get lock /var/lib/dpkg/lock - open (11 Resource temporarily unavailable)

E: Unable to lock the administration directory (/var/lib/dpkg/) is another process using it?
```
```
sudo rm /var/lib/apt/lists/lock

sudo rm /var/cache/apt/archives/lock

sudo rm /var/lib/dpkg/lock
```

## 2. [Get rid of Sudo](https://unix.stackexchange.com/a/26077)

```
sudo chown sanhpv /var/run/docker.sock
```
## 3. MySQL: Access denied for user 'root'@'localhost'

```
sudo service mysql stop

sudo mysqld_safe --skip-grant-tables &

mysql -u root
```

``` mysql
mysql> use mysql;
Database changed
mysql> select * from  user;
Empty set (0.00 sec)
mysql> truncate table user;
Query OK, 0 rows affected (0.00 sec)
mysql> flush privileges;
Query OK, 0 rows affected (0.01 sec)
mysql> grant all privileges on *.* to root@localhost identified by 'YourNewPassword' with grant option;
Query OK, 0 rows affected (0.01 sec)
mysql> select host, user from user;
+-----------+------+
| host      | user |
+-----------+------+
| localhost | root |
+-----------+------+
1 row in set (0.00 sec)
mysql> quit;
```
```
[root ~]# kill -KILL [PID of mysqld_safe]
[root ~]# kill -KILL [PID of mysqld]
[root ~]# service mysql start
```

#Some helpful command

1. Multiple firefox profile
```
./firefox -ProfileManager
```
2. services
```
sudo service --status-all | grep +
sudo service mysql start
sudo service mysql stop
```
3. docker
```
docker exec -it f525926e0172 bash
docker inspect ce84c1397ff0 --format '{{ .Config.Env | json }}' | python -m json.tool
docker images
docker ps
docker rmi name_of_image
docker-compose pull
docker-compose up
docker-compose up --force-recreate
docker-compose down
```
4. maven
```
mvn clean package
mvn clean install
mvn -Dmaven.test.skip=true install
mvn -Dmaven.test.skip=true -Dspring.profiles.active=docker install
```
5. java
```
update-java-alternatives --set java-1.8.0-openjdk-amd64
```
6. systemctl
```
systemctl disable docker # disable boot service
systemctl --user start pulseaudio
systemctl --user status pulseaudio
```
7. sqlmap
```
sqlmap -r ~/BurpRequest/minglex -p id --dbms=MySql --dbs --proxy=http://127.0.0.1:8080 --flush-session
```
8. python
```
python -m SimpleHTTPServer 9696
```
9. netstat
```
netstat -anl | grep LIST | grep 3306
```
10. time
```
time ls -R
```