# pm2

- docs: https://pm2.keymetrics.io/

```
npm install pm2 -g
pm2 start app.js --name my-api
pm2 list

pm2 logs my-api
pm2 restart my-api
pm2 stop my-api
pm2 reload my-api

pm2 status
pm2 save
pm2 startup


pm2 ls
pm2 monit

pm2 start ./script.sh --name my-script
pm2 start app.py --name flask-app --interpreter=python
pm2 delete flask-app
```
