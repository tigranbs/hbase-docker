## About

This repo aims to make a very simple Docker image for testing out HBase for a single node and figure out if you really need it for your environment.

## Starting up

Things are as simple as just starting up docker container, rest is on you how to connect and use HBase database

```bash
# Building container image
docker build -t hbase .

# Running container with mapped ports for access
docker run --rm -it -p 16010:16010 -p 8080:8080 -p 8085:8085 -p 9090:9090 -p 9095:9095 -p 16000:16000 -p 16020:16020 hbase
```

After running this commands and having Docker container running you can access HBase Web UI by going to `http://localhost:16010`

## Data Volume Mount

For filling out a ton of data you might want to mount custom volume for your HBase container. Current configuration is done in a way that 
Data goes to `/root/data` which you can mount to something else with Docker volumes.

