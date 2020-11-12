FROM kafkamanager/kafka-manager

ENV KAFKA_MANAGER_DIR="/opt/cmak-3.0.0.4"

COPY fix-permissions.sh ./

RUN chmod +x fix-permissions.sh

RUN ./fix-permissions.sh $KAFKA_MANAGER_DIR

EXPOSE 8080

RUN ls -la $KAFKA_MANAGER_DIR/bin/

WORKDIR $KAFKA_MANAGER_DIR

ENTRYPOINT [ "bin/cmak", "-Dhttp.port=8080" ]
