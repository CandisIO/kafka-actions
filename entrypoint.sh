#!/bin/sh

docker_run="docker run"
run_zookeeper="$docker_run -d --name zookeeper --network kafka-network -p 2181:2181 -e ALLOW_ANONYMOUS_LOGIN=yes bitnami/zookeeper:$INPUT_ZOOKEEPER_VERSION"
run_kafka="$docker_run -d --name kafka --network kafka-network -p 9092:9092 -e KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper:2181 -e KAFKA_CFG_ADVERTISED_LISTENERS='CLIENT://kafka:29092,EXTERNAL://localhost:9092' -e KAFKA_CFG_LISTENER_SECURITY_PROTOCOL_MAP='CLIENT:PLAINTEXT,EXTERNAL:PLAINTEXT' -e KAFKA_CFG_LISTENERS='CLIENT://:29092,EXTERNAL://:9092' -e KAFKA_CFG_INTER_BROKER_LISTENER_NAME=CLIENT -e KAFKA_CFG_AUTO_CREATE_TOPICS_ENABLE=true -e ALLOW_PLAINTEXT_LISTENER=yes bitnami/kafka:$INPUT_KAFKA_VERSION"

docker network create kafka-network --driver bridge
sh -c "$run_zookeeper"
sh -c "$run_kafka"
