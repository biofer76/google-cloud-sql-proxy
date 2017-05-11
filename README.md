Google SQL Proxy
========================

[SQL Proxy](https://cloud.google.com/sql/docs/mysql/sql-proxy) is a tool made by Google, it allows you to connect to [Google MySQL Service](https://cloud.google.com/sql/) without IP restrictions and authentication mechanism [managed by IAM roles](https://cloud.google.com/iam). Very useful when you are working with a cluster of auto-scaling instances, where all instances IP are ephemeral and auto-assigned.

Install
---------

Just run install command

```
./install.sh
```

Configuration
-------------

Depends from process manager  

**Run by init.d**

```
# Copy LSB file
cp init.d/cloud_sql_proxy /etc/init.d/cloud_sql_proxy

# Edit and move configuration file to secure folder as .sql_proxy file
cp init.d/sql_proxy.config /root/.sql_proxy

# Update runlevels (start at boot)
update-rc.d cloud_sql_proxy enable

# Manual Start / Stop commands
/etc/init.d/cloud_sql_proxy {start|stop|restart}

```

**Variables**

`INSTANCE_CONNECTION_NAME`

Connection name available in Google SQL service

**Run by supervisor**

```
# Install supervisor

apt-get install supervisor -y

# Edit and copy configuration to supervisor conf folder 

cp supervisor/cloud_sql_proxy.conf /etc/supervisor/conf.d/cloud_sql_proxy.conf

```

**Variables**

Check file `supervisor/cloud_sql_proxy.conf` and edit placeholders

`SET_NAME` set your process/program name

`COMMAND`add your supervisor managed process/program

Customize other values as you prefer.


Connect to MySQL database
-------------------------

Install mysql client on local machine then use command `mysql`with connection arguments

```
# Install MySQL Client
apt-get install mysql-client -y

# Connect to MySQL by SQL Proxy 
mysql -u root -p -h 127.0.0.1
[password]
```

**MySQL root auto-login without password**

Set DB access credentials in `/root/.my.cnf`

```
[client]
username=root
password=ROOT_PASSWORD
host=127.0.0.1
```

You can access to MySQL server by `mysql` command without arguments, it also works with mysqldump command for quickly backup operations.

TODO
____

- Verify if .sql_proxy file exist and variables are set


Contributing changes
--------------------


Licensing
---------

````
The MIT License (MIT)

Copyright (c) 2017 Fabio Ferrari at particles.io

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```


