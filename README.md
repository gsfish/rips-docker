# rips-docker

Docker image for [Re-Inforce Programming Security (RIPS))](http://rips-scanner.sourceforge.net/).

## Installation

Pull from docker hub:

```
docker pull rips-docker
```

Build from source:

```
git clone https://github.com/gsfish/rips-docker.git
docker build -t rips-docker .
```

## Usage

```
docker run -d -p 80:80 -v PATH_TO_YOUR_TARGET:/target rips-docker
```
