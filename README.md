# kafka-actions

This [GitHub Action](https://github.com/features/actions) sets up Bitnami Kafka instance

This project started as a a fork of https://github.com/bbcCorp/kafka-actions, and got adjusted to work with Kafka 3.2.0 and Zookeeper 2.8.1

---

## Usage

See [action.yml](action.yml)

Basic:

```yaml
- name: Start Bitname Kafka
  uses: candis/kafka-actions@v0.0.2
  # Optionally input values can be provided as follows:
  with: 
    kafka version: 3.2.0
    zookeeper version: 3.7.1

```

Now you should be able to consume and publish messages to the Kafka broker running at `localhost:9092`.

If you want to connect with a client from docker use port `29092`. For example, if you need to list the topics:

```bash
docker run -it --rm --network gh-kafka-network \
  -e KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper:2181 \
  bitnami/kafka:latest kafka-topics.sh --list --bootstrap-server kafka:29092
```

### When running locally

The following environment variables are required (as defined in the [action.yml](action.yml) file).

```bash
export INPUT_ZOOKEEPER_PORT=2181
export INPUT_ZOOKEEPER_VERSION=3.7.1
export INPUT_KAFKA_PORT=9092
export INPUT_KAFKA_CLIENT_PORT=29092
export INPUT_KAFKA_VERSION=3.2.0
```

---

## License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
