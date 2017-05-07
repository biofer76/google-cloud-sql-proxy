## Install and run GOOGLE SQL Proxy

### CONFIGURATION REQUIRED
Make sure that file *[user home]/.sql_proxy* is available and reading permissions are set

**Sample Files**

You can copy sample file *.sql_proxy* to *[user home]/.sql_proxy*

```
cp sql_proxy.config ~/.sql_proxy
```

Proxy starts after booting by rc.d configuration.
Be sure *~/.sql_proxy* file is updated with correct information

```
# Set MySQL connection name available in Google SQL Service
INSTANCE_CONNECTION_NAME=''
```

### How to start / stop cloud sql proxy

```
/etc/init.d/cloud_sql_proxy {start|stop|restart}
```

### How to connect to MySQL database

```
mysql -u root -p -h 127.0.0.1
[password]
```

**MySQL root autologin**

Set DB access credentials in */root/.my.cnf*

```
[client]
username=root
password=ROOT_PASSWORD
host=127.0.0.1
```

Then you can access to DBs by `mysql` command without arguments, it also works with mysqldump command for quickly backup operations.

### TODO

- Verify if .sql_proxy file exist and variables are set
- Add new .sql_proxy file during installation
