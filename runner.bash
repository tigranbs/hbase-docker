#!/usr/bin/env bash

export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which javac))))
./bin/start-hbase.sh
./bin/hbase-daemon.sh start rest
tail -f "logs/$(ls logs | head -n 1)"