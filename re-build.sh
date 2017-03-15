#!/bin/bash

docker rmi -f --no-prune sqlcl-1.0
#docker build --network orcl-net --no-cache -t sqlcl-1.0 .
docker build --network orcl-net -t sqlcl-1.0 .
docker run -it --net orcl-net sqlcl-1.0 /bin/bash -l
#docker run -it --net orcl-net sqlcl-1.0 "system/welcome1@//xe-2.2:1521/xe"
