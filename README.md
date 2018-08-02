# Install for Kali
## [Adding a new user in Kali Linux](https://www.linkedin.com/pulse/20140502074357-79939846-adding-a-new-user-in-kali-linux)

```sh
useradd -m username

passwd username

usermod -a -G sudo username

chsh -s /bin/bash username
```
## [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh)

```sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"```

## [Install Docker](https://www.ptrace-security.com/2017/06/14/hackontuesday-episode-7-how-to-install-docker-on-kali-linux-2017-1/)

## [Install Docker Compose](https://docs.docker.com/compose/install/)

```sh
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## [Install Visual Studio Code](https://code.visualstudio.com/docs/setup/linux#_installation)

```sh
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
```sh
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
```sh
    curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
    sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
    sudo apt-get update
    sudo apt-get install atom
```
## [Install ‘apt-fast’ to Speed Up apt-get/apt Package Downloads Using Multiple Mirrors](https://github.com/ilikenwf/apt-fast)

- Firstly add the the PPA for apt-fast package as follows and then update your system.
```
sudo add-apt-repository ppa:apt-fast/stable
sudo apt-get update
```
- Then
```
sudo apt-get -y install apt-fast
```
## Install Mongodb (docker)

- Dockerfile

```dockerfile
FROM mongo
VOLUME /data/db
```

- build mongo image: ```docker build -t mongodb-expose-27017 .```

- docker-compose.yml

```yml
version: '3'
services:
  mongodb:
    container_name: mongodb-expose-27017
    image: mongo
    ports:
      - 27017:27017
    volumes:
      - ./db:/data/db
```
- [install MongoDB Compass](https://docs.mongodb.com/compass/master/install/):

```sh
wget https://downloads.mongodb.com/compass/mongodb-compass_1.12.5_amd64.deb;
sudo dpkg -i mongodb-compass_1.12.5_amd64.deb;
DEBUG=* mongodb-compass;
```
- Test connect by NodeJs:

```js
const MongoClient = require('mongodb').MongoClient

MongoClient.connect('mongodb://0.0.0.0:27017', (err, database) => {
    if (err) return console.log(err)
    db = database.db("db_name")
    collection = db.collection("collection_name")
})
```

## Install Ibus Unikey

```sh
sudo apt-get install ibus-unikey
```
- Logout and login again to make new plugin works.

- Go to ```Settings``` -> ```Region & Language```, add ```Vietnamese(Unikey)```.

- To switch input type press ```Supper``` + ```Space```

# Error

## 1. Cannot use apt-get 

```
E: Could not get lock /var/lib/dpkg/lock - open (11 Resource temporarily unavailable)

E: Unable to lock the administration directory (/var/lib/dpkg/) is another process using it?
```
```sh
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
```sh
[root ~]# kill -KILL [PID of mysqld_safe]
[root ~]# kill -KILL [PID of mysqld]
[root ~]# service mysql start
```
## 4. /var/log Disk Space Issues

- Recently, I started noticing that my computer keeps running out of space for no reason at all. I
mean I didn't download any large files and my root drive should not be having any space
issues, and yet my computer kept tellling me that I had '0' bytes available or free on my /root/
drive. As I found it hard to believe, I invoked the 'df' command (for disk space usage):
```
sanhpv@kali: df

Filesystem     1K-blocks     Used Available Use% Mounted on
udev             1951988        0   1951988   0% /dev
tmpfs             394016    41468    352548  11% /run
/dev/sda3       62799588 39764444    815384  97% /
tmpfs            1970072   281384   1688688  15% /dev/shm
tmpfs               5120        0      5120   0% /run/lock
tmpfs            1970072        0   1970072   0% /sys/fs/cgroup
/dev/sda1          98304    29425     68879  30% /boot/efi
tmpfs             394012       12    394000   1% /run/user/130
tmpfs             394012       52    393960   1% /run/user/1000

sanhpv@kali: find / -size +2000M

/var/log/kern.log
/var/log/messages.1
/var/log/messages
/var/log/syslog
/var/log/kern.log.1
```
- Clearly, the folder '/var/log' needs my attention. Seems like some kernel log files are
humongous in size and have not been 'rotated' (explained later). So, I listed the contents of
this directory arranged in order of decreasing size:

```
sanhpv@kali: cd /var/log
sanhpv@kali: ls -s -S

total 34891876
15180996 kern.log.1       107372 syslog.6.gz          40 auth.log                4 exim4                     4 stunnel4
 4658020 messages.1        93308 syslog.5.gz          40 user.log                4 gdm3                      4 sysstat
 4241176 syslog            58468 messages.2.gz        36 daemon.log.2.gz         4 glusterfs                 4 unattended-upgrades
 4222736 kern.log          25388 debug.2.gz            4 faillog                 4 inetsim                   4 alternatives.log
 1921736 debug.1            5356 user.log.1           32 wtmp                    4 installer                 4 macchanger.log.1.gz
 1762268 syslog.1            896 daemon.log.1         16 daemon.log              4 mysql                     4 macchanger.log.2.gz
 1285180 messages              4 lastlog               8 auth.log.2.gz           4 nginx                     0 bootstrap.log
  517736 debug               236 auth.log.1            4 apache2                 4 ntpstats                  0 btmp
  323240 syslog.4.gz         140 user.log.2.gz         4 apt                     4 openvpn                   0 fontconfig.log
  200320 kern.log.2.gz        84 dpkg.log              4 chkrootkit              4 postgresql
  162340 syslog.2.gz           4 tallylog              4 couchdb                 4 samba
  124556 syslog.3.gz          48 Xorg.1.log            4 dradis                  4 speech-dispatcher

sanhpv@kali: sudo /etc/cron.daily/logrotate
```
- It ran for a while as it rotated the logs. logrotate is meant to automate the task of
administrating log files on systems that generate a heavy amount of logs. It is responsible for
compressing, rotating, and delivering log files. Read more about it [here](https://linux.die.net/man/8/logrotate).

- What I hoped by running logrotate was that it would rotate and compress the old log files so I
can quickly remove those from my system. Why didn't I just delete that '/var/log' directory
directly? Because that would break things. '/var/log' is needed by the system and the system
expects to see it. Deleting it is a bad idea. So, I needed to ensure that I don't delete anything
of significance.
After a while, logrotate completed execution and I was able to see some '.gz' compresses files
in this directory. I quickly removed (or deleted) these.

- Since these had already been rotated, I figured it would be safe to remove these as well. But instead of doing
an 'rm' to remove them, I decided to just empty them (in case they were being used
somewhere)

```
sanhpv@kali: sudo su
sanhpv@kali: >kern.log.1
sanhpv@kali: >messages.1
sanhpv@kali: >syslog
sanhpv@kali: >kern.log
```

# Some helpful command

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
```sh
docker exec -it f525926e0172 bash
docker inspect ce84c1397ff0 --format '{{ .Config.Env | json }}' | python -m json.tool
docker images
docker ps
docker rmi name_of_image
docker-compose pull
docker-compose up
docker-compose up --force-recreate
docker-compose down
docker stop $(docker ps -q)    #stop all containers, forcefully: -f
docker rm $(docker ps -a -q)   #remove all containers, forcefully: -f
docker rmi $(docker images -q) #remove all docker images, forcefully: -f
docker volume ls -qf dangling=true | xargs -r docker volume rm #remove all docker volumes
docker rm (docker ps -a |grep redis |awk '{print $1}') #Remove all containers by image.ex: remove all redis containers:
```
- Dockerfile

```dockerfile
FROM maven:3.5-jdk-8

# Build source -> java application
COPY ./app /app
WORKDIR /app
RUN mvn -Dmaven.test.skip=true install

# Install some python packages(Todo: need build another image that has these package first)
WORKDIR /tmp
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py
RUN apt update -y
RUN apt install python-dev libpq-dev -y
RUN apt-get install python-mysqldb -y

# Python script for run later
COPY ./wait-for-mysql.py /tmp/wait-for-mysql.py
```
```python
import MySQLdb
import time
def try_to_connect():
    print("Trying to connect aws-mysql.")
    try:
        connection = MySQLdb.connect(
                host = 'aws-mysql',
                user = 'sanhpv',
                passwd = 'NYBpHxUmbGC9u3PMdPCR') #NUT YELP BESTBUY park HULU xbox USA music bestbuy GOLF COFFEE 9 usa 3 PARK MUSIC drip PARK COFFEE ROPE 
        cursor = connection.cursor()
        cursor.execute("USE aws-db")
    except Exception, e:
        print str(e)
        time.sleep(5)
        try_to_connect()

try_to_connect()
```
- docker-compose.yml

```yml
command: bash -c "python /tmp/wait-for-mysql.py && echo 'aws-mysql works fine' && java -jar -Dspring.profiles.active=docker ./target/app.jar"
```

- Pushing the docker image to docker hub repository:

```
docker login
docker build -t sanhphanvan/awesome .
docker push sanhphanvan/awesome
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
```sh
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
```python
import code
code.interact(local=dict(globals(), **locals()))
```
- with Ruby/Rails

```
gem install pry
```
```ruby
require 'pry'

puts 'requiring pry'
binding.pry
```
```ruby
From: /home/richard/Documents/eCommerceExample/spec/controllers/categories_controller_spec.rb @ line 21 :

    16:     end
    17:
    18:     include_examples 'sets the proper global variables'
    19:
    20:     it "returns http success" do
 => 21:       binding.pry
    22:       expect(response).to have_http_status(:success)
    23:     end
    24:
    25:     it 'returns a list of categories' do
    26:       expect(assigns(:categories).size).to eq(1)

[1] pry(#<RSpec::ExampleGroups::CategoriesController::GETShow>)>
```
9. netstat
```
netstat -anl | grep LIST | grep 3306
```
10. time
```
time ls -R
```
11. apt / apt-get
- ran a dpkg command to install a couple of .deb packages (ex: ```sudo dpkg -i google-chrome-stable_current_amd64.deb```), but the install failed because some dependencies were missing.
```sh
apt-get -f install #-f, --fix-broken
```
- Most used commands:
```
  update - Retrieve new lists of packages
  upgrade - Perform an upgrade
  install - Install new packages (pkg is libc6 not libc6.deb)
  remove - Remove packages
  purge - Remove packages and config files
  autoremove - Remove automatically all unused packages
  dist-upgrade - Distribution upgrade, see apt-get(8)
  dselect-upgrade - Follow dselect selections
  build-dep - Configure build-dependencies for source packages
  clean - Erase downloaded archive files
  autoclean - Erase old downloaded archive files
  check - Verify that there are no broken dependencies
  source - Download source archives
  download - Download the binary package into the current directory
  changelog - Download and display the changelog for the given package
```
12. ngrok
- To start a HTTP tunnel on port 80, run this next: 
```
./ngrok http 80
```
13. yarn and npm
```sh
npm install === yarn #Install is the default behavior.
npm install taco --save === yarn add taco #The Taco package is saved to your package.jsonimmediately.
npm uninstall taco --save === yarn remove taco #--savecan be defaulted in NPM by npm config set save true but this is non-obvious to most developers. Adding and removing from package.json is default in Yarn.
npm install taco --save-dev === yarn add taco --dev
npm update --save === yarn upgrade
npm install taco@latest --save === yarn add taco
npm install taco --global === yarn global add taco

npm init === yarn init
npm link === yarn link
npm outdated === yarn outdated
npm publish === yarn publish
npm run === yarn run
npm cache clean === yarn cache clean
npm login === yarn login
npm test === yarn test
npm install --production === yarn --production

```
- [Things yarn has that NPM doesn’t](https://infinite.red/files/yarn.pdf)

```yarn licenses ls``` — Allows you to inspect the licenses of your dependencies

```yarn licenses generate-disclaimer``` — Automatically create your license dependency disclaimer

```yarn why taco``` — Identify why ‘taco’ package is installed, detailing which other packages depend upon it (thanks Olivier Combe).

```yarn upgrade-interactive``` — Allows you to selectively upgrade specific packages in a simple way

14. [Rails simple cheat sheet](https://gist.github.com/mdang/95b4f54cadf12e7e0415)

15. Git

- Squash and Merge: Takes all the commits from the ```bugfix``` branch and merges it with your current branch (ex: ```master```).

```
git checkout master
git merge --squash bugfix
git commit
```

# END
```code = developer + coffee;```