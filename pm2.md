# pm2

- docs:
    - https://pm2.keymetrics.io/
    - https://pm2.keymetrics.io/docs/usage/quick-start/

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

pm2 start python-app.py --watch
pm2 start app.js --watch --ignore-watch="node_modules"
```


```bash
# Specify an app name
--name <app_name>

# Watch and Restart app when files change
--watch

# Set memory threshold for app reload
--max-memory-restart <200MB>

# Specify log file
--log <log_path>

# Pass extra arguments to the script
-- arg1 arg2 arg3

# Delay between automatic restarts
--restart-delay <delay in ms>

# Prefix logs with time
--time

# Do not auto restart app
--no-autorestart

# Specify cron for forced restart
--cron <cron_pattern>

# Attach to application log
--no-daemon
```
