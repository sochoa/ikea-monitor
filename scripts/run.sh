#!/bin/bash -ex 
docker run -it --rm                     \
  -v $(pwd)/data:/srv/ikea-monitor/data \
  ikea-monitor                          \
  /bin/bash
