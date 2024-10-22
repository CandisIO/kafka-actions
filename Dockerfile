ARG accountId
ARG region

FROM ${accountId}.dkr.ecr.${region}.amazonaws.com/docker:stable

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
