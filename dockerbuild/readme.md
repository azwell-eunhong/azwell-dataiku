# dataiku docker build and deploy

## volume mount
docker volume create \
-d local \
-o type=none \
-o device=/mnt/volume-mount \
-o o=bind
dss_design



## docker build

### license file upload
<pre>
	lidense 파일은 license.json 파일명으로 Dockerfile 과 동일한 위치에 저장
</pre>

### base image build
<pre>
	baseImage 디렉토리에 로 이동 후 dataiku version 에 따라 Basic Image build
	Base os : almalinux/8-base 사용
	base os 를 변경이 필요할 경우 각 os 별 필수 설치 패키지 확인 
</pre>

```
docker build --build-arg DSS_VERSION=13.5.5 -t dataiku-base:v13.5.5 .
```


### 각 버젼별 dss_install
Dockerfile 내의 
<B>"FROM dataiku-base:v13.5.5"</B>
부분을 위 baseimage 명으로 변경

```
docker build --build-arg DSS_VERSION=13.5.5 --build-arg NODE_TYPE=design -t dss-design:13.5.5 .
```

dataiku install

```
docker run -id --name dss13 -v dss_design:/data -p 8181:11000 dss-design:13.5.5 install
```

dataiku upgrade
<pre>
	upgrade 전에 docker process 에서 사용하는 volume 의 물리 파일을 백업
</pre>

```
docker run -id --name dss13 -v dss_design:/data -p 8181:11000 dss-design:13.5.5 upgrade
```
