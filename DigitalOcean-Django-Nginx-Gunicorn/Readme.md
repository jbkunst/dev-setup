## How To Install and Configure Django with Postgres, Nginx, and Gunicorn

[source](https://www.digitalocean.com/community/articles/how-to-install-and-configure-django-with-postgres-nginx-and-gunicorn)

You must have:
- A droplet in digitalOcean
- Other thing
- One more

### 1

```
sudo apt-get update
sudo apt-get upgrade
```

### 1.1

```
sudo apt-get install git libmysqlclient-dev python-dev python-virtualenv
```


### 2

```
sudo virtualenv /opt/myenv
source /opt/myenv/bin/activate
```

### 3

```
pip install django
```

### 4 Optional

```
deactivate
sudo apt-get install libpq-dev python-dev
sudo apt-get install postgresql postgresql-contrib

sudo service postgresql start
sudo su - postgres
createdb mydb
createuser -P
psql
GRANT ALL PRIVILEGES ON DATABASE mydb TO myuser;
```

### 5

```
sudo apt-get install nginx
```

### 6

```
source /opt/myenv/bin/activate
pip install gunicorn
```

### 7 Optional I

```
cd /opt/myenv
source /opt/myenv/bin/activate
django-admin.py startproject myproject
pip install psycopg2
suno nano settigs.py
```

### 8 Optional II
```
sudo git clone https://github.com/jbkunst/mysite.git
```

### 9

```
gunicorn_django --bind jkunst.com:8001
gunicorn_django --workers=3 --bind jkunst.com:8001
cd /opt/myenv
sudo nano gunicorn_config.py
```

The file must contain:
```
command = '/opt/myenv/bin/gunicorn'
pythonpath = '/opt/myenv/mysite'
bind = '127.0.0.1:8001'
workers = 3
user = 'nobody'
```

```
/opt/myenv/bin/gunicorn -c /opt/myenv/gunicorn_config.py mysite.wsgi
```

### 11

```
cd ..
cd mkdir static_root
cd myproject
python manage.py collectstatic
```

### 10
```
sudo service nginx start
sudo nano /etc/nginx/sites-available/myproject
```

```
server {
        server_name jkunst.com;

        access_log off;

        location /static/ {
            alias /opt/myenv/static_root/;
        }

        location / {
                proxy_pass http://127.0.0.1:8001;
                proxy_set_header X-Forwarded-Host $server_name;
                proxy_set_header X-Real-IP $remote_addr;
                add_header P3P 'CP="ALL DSP COR PSAa PSDa OUR NOR ONL UNI COM NAV"';
        }
    }
```


```
cd /etc/nginx/sites-enabled
sudo ln -s ../sites-available/mysite
sudo service nginx restart
```
