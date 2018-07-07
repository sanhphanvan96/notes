# Install for Kali
## [Adding a new user in Kali Linux](https://www.linkedin.com/pulse/20140502074357-79939846-adding-a-new-user-in-kali-linux)

- useradd -m username

- passwd username

- usermod -a -G sudo username

- chsh -s /bin/bash username
## [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh)

- sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## [Install Docker](https://www.ptrace-security.com/2017/06/14/hackontuesday-episode-7-how-to-install-docker-on-kali-linux-2017-1/)

## [Install Docker Compose]()

- sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

- sudo chmod +x /usr/local/bin/docker-compose

## [Install Visual Studio Code](https://code.visualstudio.com/docs/setup/linux#_installation)

- sudo dpkg -i <file>.deb
- sudo apt-get install -f # Install dependencies

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
# Error

## 1. Cannot use apt-get 

E: Could not get lock /var/lib/dpkg/lock - open (11 Resource temporarily unavailable)

E: Unable to lock the administration directory (/var/lib/dpkg/) is another process using it?

- sudo rm /var/lib/apt/lists/lock

- sudo rm /var/cache/apt/archives/lock

- sudo rm /var/lib/dpkg/lock

## 2. [Get rid of Sudo](https://unix.stackexchange.com/a/26077)

- sudo chown sanhpv /var/run/docker.sock

## 3. Access denied for user 'root'@'localhost'

- sudo service mysql stop

- sudo mysqld_safe --skip-grant-tables &

- mysql -u root

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



