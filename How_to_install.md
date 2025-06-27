## Git에 연결하여 필요 패키지 다운로드 받기

## 패키지 설치
```
sudo dnf install <GIT PATH>/dev-tools/*.rpm
sudo dnf install <GIT PATH>/etc/*.rpm
```

## 설치 경로

> /data/  
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└┬ dataiku/ ─ dataiku-dss-13.5.5/  
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;│      &nbsp;└─ data_dir/  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└ postgres/ ─ data/
> 

## Dataiku 설치

```bash
cd /data/dataiku
tar xzf dataiku-dss-13.5.5.tar.gz
./dataiku-dss-13.5.5/installer.sh -d /data/dataiku/data_dir -p 11000
```

## Postgresql 설치 및 연동

(압축 해제 후)

```bash
cd /data/postgres

./configure
make
sudo make install
sudo adduser postgres
sudo adduser dss_db

sudo mkdir -p /data/postgres/data
sudo chown postgres /data/postgres/data

./postgres/bin/initdb -D /data/postgres/data
./postgres/bin/pg_ctl -D /data/postgres/data -l logfile start
./postgres/bin/createdb dataiku
./postgres/bin/psql dataiku
```

`/etc/systemd/system/postgresql.service`

```bash
[Unit]
Description=PostgreSQL database server
Documentation=man:postgres(1)
After=network-online.target
Wants=network-online.target

[Service]
Type=notify
User=dss_db
ExecStart=/data/postgres/bin/postgres -D /data/postgres/data
ExecReload=/bin/kill -HUP $MAINPID
KillMode=mixed
KillSignal=SIGINT
TimeoutSec=infinity

[Install]
WantedBy=multi-user.target
```

`config/general-settings.json`

```bash
    "connection": {
        "params": {
            "port": 5432,
            "host": "localhost",
            "user": "dataiku",
            "password": "dataiku",
            "db": "dataiku"
        },
        "type": "PostgreSQL"
    },

    "schema" : "dataiku",
```

```bash
systemctl start postgresql.service

./bin/dssadmin copy-databases-to-external
```