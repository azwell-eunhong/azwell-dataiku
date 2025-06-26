# install script

```
sudo yum groupinstall -y "Development Tools"
```

```
sudo yum install -y \
  readline-devel \
  zlib-devel \
  bison \
  flex \
  openssl-devel \
  libuuid-devel \
  libicu-devel
```

```
sudo yum install -y \
 acl \
 expat \
 git \
 nginx \
 unzip \
 zip \
 gcc-gfortran \
 freetype 
```

# nginx install 

## Amazon Linux Extras에서 nginx 설치 (Amazon Linux 2 전용)

```
sudo amazon-linux-extras enable nginx1
sudo yum clean metadata
sudo yum install -y nginx
```

version check

```
nginx -v
```

## EPEL 또는 nginx 공식 repo 추가 (Amazon Linux 2 & AL2023 가능)

sudo tee /etc/yum.repos.d/nginx.repo <<EOF
[nginx-stable]
name=nginx stable repo
baseurl=https://nginx.org/packages/centos/7/\$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
EOF

sudo yum install -y nginx

## nginx start

```
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx
```

# installed pakage download

## installed package list

```
rpm -qa
```

rpm -qa > installed-package.txt

## yum util install

```
sudo yum install -y yum-utils
```

```
mkdir packages
```

```
for pkg in $(rpm -qa);do
	sudo yumdownloader --destdir=./packages $pkg
done
```

```
sudo yum localinstall --nogpgcheck *.rpm
```

## yumdownloader 에러 상황시

```
sudo yum clean all

sudo yum makecache

```

## 모든 의존성 포함 다운로드

```
sudo repotrack --arch=x86_64 -p ./packages $(rpm -qa)
```







