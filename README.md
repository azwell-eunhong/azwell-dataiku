# azwell-dataiku


<pre>
아래 명령어를 통해서 다운 로드 받았습니다

sum 파일은 checksum 파일입니다.
  
packages 하위 디렉토리에 설치 패키지 들이 있습니다.

checksum은 sha256 으로 인코딩 했습니다.
 
아래와 같이 하시면 'OK' 가 나오면 정상적으로 받으신 것입니다.

sha256sum -c dev-tools.sum

sha256sum -c etc.sum


</pre>
package list 는 아래 파일을 확인 하시기 바랍니다.

[etc.txt](./packages/etc.txt)

[dev-tools.txt](./packages/dev-tools.txt) 


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

패키지 다운로드

```
curl -LO https://downloads.dataiku.com/public/dss/13.5.5/dataiku-dss-13.5.5.tar.gz

```

checksum 다운로드

```
curl -LO https://downloads.dataiku.com/public/dss/13.5.5/dataiku-dss-13.5.5-sha256sums.txt
```

파일 정합성 체크

Dataiku gz 파일 압축을 푼 후 실행

```
sha256sum -c dataiku-dss-13.5.5-sha256sums.txt
```


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

패키지 다운로드

```
curl -LO https://ftp.postgresql.org/pub/source/v17.5/postgresql-17.5.tar.gz

```

checksum 다운로드

```
https://ftp.postgresql.org/pub/source/v17.5/postgresql-17.5.tar.gz.sha256
```

파일 정합성 체크

```
sha256sum -c postgresql-17.5.tar.gz.sha256
```


## amazon corretto java version 17

<pre>
  자바 설치를 위한 공식 문서는 아래와 같습니다
  https://docs.aws.amazon.com/corretto/latest/corretto-17-ug/downloads-list.html
</pre> 

<a href="https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.rpm"> java rpm package </a>

설치는 rpm 다운로드 디렉 토리에서 실행 하시면 됩니다.

```
curl -LO https://corretto.aws/downloads/latest/amazon-corretto-17-x64-linux-jdk.rpm
```

```
sudo yum localinstall -y --nogpgcheck amazon-corretto-17-x64-linux-jdk.rpm
```


java version check

```
java -version
```

<pre>
  openjdk version "17.0.15" 2025-04-15 LTS
  OpenJDK Runtime Environment Corretto-17.0.15.6.1 (build 17.0.15+6-LTS)
  OpenJDK 64-Bit Server VM Corretto-17.0.15.6.1 (build 17.0.15+6-LTS, mixed mode, sharing)
</pre>


## Python libraries

설치 또는 Dataiku 사용에 필요한 라이브러리 파일들

req.txt

```
pandas>=2.2,<2.3
numpy<1.27
python-dateutil >=2.8.2,<3
urllib3<2
requests<3
decorator==5.1.1
ipykernel==6.23.3
ipython>=8.12,<8.13
ipython_genutils==0.2.0
jupyter_client==6.1.12
jupyter_core==4.12.0
pexpect==4.8.0
pickleshare==0.7.5
ptyprocess==0.7.0
pyzmq==23.2.1
simplegeneric==0.8.1
tornado>=6.3,<6.4
traitlets==5.9.0
```


library 목록

[python libraries list](./packages/python-lib.txt) 

[Libraries 디렉토리](./packages/python-lib)

[checksum file](./packages/python-lib.sum)

checksum 확인

```
sha256sum -c python-lib.sum
```