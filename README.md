# azwell-dataiku
## dev-tools.tar.gz 파일 내용
<ore>
	아래 명령어를 통해서 다운 로드 받았습니다
	sum 파일은 checksum 파일입니다.
	sha256 으로 인코딩 했습니다.
	아래와 같이 하시면 'OK' 가 나오면 정상적으로 받으신 것입니다.

	sha256sum -c dev-tools.tar.gz.sum

	sha256sum -c postgresql-install.tar.sum
	
	sha256sum -c etc.tar.sum

</ore>

```
sudo yum groupinstall --y --downloadonly --downloaddir=./dev-tools
```

## postgresql-install.tar 파일 내용
```
sudo yum install -y --downloadonly --downloaddir=./postgresql-install \
  readline-devel \
  zlib-devel \
  bison \
  flex \
  openssl-devel \
  libuuid-devel \
  libicu-devel
```

## etc.tar 파일 내용
```
sudo yum reinstall -y --downloadonly --downloaddir=./etc \
 acl \
 expat \
 git \
 nginx \
 unzip \
 zip \
 gcc-gfortran \
 freetype
 ```

