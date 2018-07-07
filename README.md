# Install for Kali
## [Adding a new user in Kali Linux](https://www.linkedin.com/pulse/20140502074357-79939846-adding-a-new-user-in-kali-linux)

- useradd -m username

- passwd username

- usermod -a -G sudo username

- chsh -s /bin/bash username
## [Oh My ZSH](https://github.com/robbyrussell/oh-my-zsh)

- sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Install Docker



# Error

## 1. Cannot use apt-get 

E: Could not get lock /var/lib/dpkg/lock - open (11 Resource temporarily unavailable)

E: Unable to lock the administration directory (/var/lib/dpkg/) is another process using it?

- sudo rm /var/lib/apt/lists/lock

- sudo rm /var/cache/apt/archives/lock

- sudo rm /var/lib/dpkg/lock
