# rips-docker

Docker image for [Re-Inforce Programming Security (RIPS)](http://rips-scanner.sourceforge.net/).

## Installation

Pull from docker hub:

```
docker pull gsfish/rips-docker
```

Build from source:

```
git clone https://github.com/gsfish/rips-docker.git
docker build -t rips-docker .
```

## Usage

```
docker run -d --rm -p 127.0.0.1:8000:80 -v <PATH_TO_YOUR_TARGET>:/target gsfish/rips-docker
```

visit `http://localhost:8000` and start a scan for `/target`
