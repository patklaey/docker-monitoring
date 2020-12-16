# Docker Monitoring installation on ARM

## Installation
### Prerequisite
To get started, first on you host install the node-exporter script (you could also have it run on docker but this is not recommended). First make sure you have at least go version 1.14 installed
```bash
go version
```
If not make sure to install it, then follow those steps: 
```bash
go get github.com/prometheus/node_exporter
cd ${GOPATH-$HOME/go}/src/github.com/prometheus/node_exporter
make
./node-exporter
```
Check if it works by navigating with your browser to ```<your-public-ip>:9100/metrics```.
If everything is ok, stop the process and start it in the background again:
```bash
nohup ./node_exporter & 
```
And make sure it's being started on every system boot:

#### Image renderer
To be able to use image renderer on arm architecture, you have to use the build from [Legion2](https://github.com/Legion2/grafana-image-renderer/blob/master/Dockerfile) and run the following command before docker-compose up: 
```bash
docker build -t patklaey/grafana-image-renderer:2.0.0 https://github.com/Legion2/grafana-image-renderer.git
```

###