#!/bin/sh
docker pull selenoid/chrome && docker pull selenoid/firefox && docker pull selenoid/opera && docker-compose up --build
#docker-compose down --rmi all
#docker rm -vf $(docker ps -a -q)
#docker rmi -f $(docker images -a -q)