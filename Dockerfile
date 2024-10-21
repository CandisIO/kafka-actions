ARG ACCOUNT_ID
ARG REGION

FROM ${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/docker:stable

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
