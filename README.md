# Docker-in-Docker (DinD) Docker Image

[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/Scalified/docker-dind/blob/master/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/scalified/dind.svg)](https://hub.docker.com/r/scalified/dind)
[![Release](https://img.shields.io/github/v/release/Scalified/docker-dind?style=flat-square)](https://github.com/Scalified/docker-dind/releases/latest)

## Overview

**Docker** image with **Docker-in-Docker (DinD)** managed by **Supervisor**

## Usage

```
docker run \
    -d \
    --name dind \
    --privileged \
    -v $(pwd)/docker:/var/lib/docker \
    -e "DOCKER_PRUNE_SCHEDULE=0 0 * * 1" \
    scalified/dind
```

| Environment Variable    | Description                                                              |
|-------------------------|--------------------------------------------------------------------------|
| `DOCKER_PRUNE_SCHEDULE` | **Cron** schedule for auto docker system prune (`37 4 2 * *` by default) |

---

**Made with ❤️ by [Scalified](http://www.scalified.com)**
