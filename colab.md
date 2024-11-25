# Reverse Shell Colab Notebook

## Steps:

1. Install cloudflared
- https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/downloads/
```bash
!curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb -o cloudflared.deb
!sudo dpkg -i cloudflared.deb
!sudo apt-get install -f
```
2. Install pm2
```bash
!npm install -g pm2
```
3. Install netcat from source

```
!wget http://sourceforge.net/projects/netcat/files/netcat/0.7.1/netcat-0.7.1.tar.gz
!tar -xvf netcat-0.7.1.tar.gz
!cd netcat-0.7.1 && ./configure
!cd netcat-0.7.1 && sudo make && sudo make install
!mv /usr/local/bin/nc /usr/local/bin/nothing
!nothing -h
```

4. Start reverse shell

- nothing.sh
```bash
#!/bin/bash

nothing -l -p 8888 -e /bin/bash
```

```
!pm2 start nothing.sh --name nothing --watch
```

5. Start cloudflared tunnel

- tunnel.sh
```bash
#!/bin/bash

cloudflared tunnel --url tcp://localhost:8888
```

```bash
!pm2 start tunnel.sh --name tunnel
!pm2 logs tunnel #get the domain
```

6. From local machine:
- Install cloudflared
    - Docs: https://developers.cloudflare.com/cloudflare-one/applications/non-http/cloudflared-authentication/arbitrary-tcp/
    ```
    cloudflared access tcp --hostname tcp.site.com --url localhost:8888

    ```
- Connect via netcat

```bash
nc localhost 8888
python -c 'import pty; pty.spawn("/bin/bash")'
```



## Commands

```bash
%%capture --no-display
!pm2 start server.py --name server --watch && pm2 start tunnel.sh --name tunnel

!cloudflared tunnel --url http://localhost:8888
!cloudflared tunnel --url tcp://localhost:8888

!pm2 logs nothing --lines 100
!pm2 flush
!pm2 logs
!pm2 status
!pm2 stop all
!pm2 delete all

```

- https://www.ucartz.com/clients/knowledgebase/658/How-to-Install-and-Use-netcat-Command-on-Linux.html
