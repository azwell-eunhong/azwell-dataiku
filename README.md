# azwell-dataiku


<pre>
아래 명령어를 통해서 다운 로드 받았습니다

sum 파일은 checksum 파일입니다.
  
packaages 하위 디렉토리에 설치 패키지 들이 있습니다.

sha256 으로 인코딩 했습니다.
 
아래와 같이 하시면 'OK' 가 나오면 정상적으로 받으신 것입니다.

sha256sum -c dev-tools.sum

sha256sum -c etc.sum

</pre>

## dev-tools directory 파일 내용

```
sudo yum groupinstall -y --downloadonly --downloaddir=./dev-tools  "Development Tools"
```


## etc directory 파일 내용

```
sudo yum install -y --downloadonly --downloaddir=./etc \
 readline-devel \
 zlib-devel \
 bison \
 flex \
 openssl-devel \
 libuuid-devel \
 libicu-devel \
 acl \
 expat \
 git \
 nginx \
 unzip \
 zip \
 gcc-gfortran \
 freetype
 ```

## Dataiku install binary

### Dataiku 13.5.5 다운로드 링크

<a href="https://downloads.dataiku.com/public/dss/13.5.5/dataiku-dss-13.5.5.tar.gz"> dataiku 13.5.5</a>

<a href="https://downloads.dataiku.com/public/dss/13.5.5/dataiku-dss-13.5.5-sha256sums.txt">dataiku-dss-13.5.5-sha256sums.txt</a>
<pre>
binary : https://downloads.dataiku.com/public/dss/13.5.5/dataiku-dss-13.5.5.tar.gz

checksum : https://downloads.dataiku.com/public/dss/13.5.5/dataiku-dss-13.5.5-sha256sums.txt
</pre>

### plugin 다운로드 링크
<a href="https://downloads.dataiku.com/public/dss-plugins/"> dataiku plugin root directory </a>

<pre>
https://downloads.dataiku.com/public/dss-plugins/
</pre>


## Postgresql install binary

Postgresql v17.5

<a href="https://ftp.postgresql.org/pub/source/v17.5/postgresql-17.5.tar.gz"> postgresql-17.5.tar.gz </a>

<a href="https://ftp.postgresql.org/pub/source/v17.5/postgresql-17.5.tar.gz.sha256">postgresql-17.5.tar.gz.sha256 </a>

<pre>
https://ftp.postgresql.org/pub/source/v17.5/
</pre>



