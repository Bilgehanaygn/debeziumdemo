#!/bin/bash

sleep 5

while ! curl --silent -o /dev/null -w '%{http_code}' http://localhost:8083 | awk '{print substr($0, length($0)-2)}' | grep -q '^200'
do
  echo "Debezium'un başlaması bekleniyor..."
  sleep 1
done


connector_name="siparis_source_connector"

siparis_source_connector_config=$(cat <<EOF
{
  "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
  "tasks.max": "1",
  "plugin.name": "pgoutput",
  "database.hostname": "postgres",
  "database.port": "5432",
  "database.user": "postgres",
  "database.password": "q",
  "database.dbname": "siparis",
  "database.server.name": "dbserver1",
  "table.include.list": "public.siparis",
  "topic.prefix": "siparis",
  "key.converter": "org.apache.kafka.connect.json.JsonConverter",
  "value.converter": "org.apache.kafka.connect.json.JsonConverter",
  "key.converter.schemas.enable": "false",
  "value.converter.schemas.enable": "false",
  "include.schema.changes": "false",
  "tombstones.on.delete": "false",
  "decimal.handling.mode": "double",
  "heartbeat.interval.ms": "1000",
  "status.storage.topic": "connect-status"
}
EOF
)

siparis_source_connector_exists() {
  curl -s -o /dev/null -w "%{http_code}" http://localhost:8083/connectors/${connector_name}
}

if [ $(siparis_source_connector_exists) -eq 200 ]; then
  echo "Connector zaten mevcut. Ayarlar güncelleniyor..."

  curl -X PUT \
       -H "Accept:application/json" \
       -H "Content-Type:application/json" \
       --data "${siparis_source_connector_config}" \
       http://localhost:8083/connectors/${connector_name}/config

  echo "Connector ayarları başarıyla güncellendi."
else
  echo "Yeni connector oluşturuluyor..."

  curl -X POST \
       -H "Accept:application/json" \
       -H "Content-Type:application/json" \
       --data "{\"name\": \"${connector_name}\", \"config\": ${siparis_source_connector_config}}" \
       http://localhost:8083/connectors

  echo "Yeni connector başarıyla oluşturuldu."
fi

echo "Sipariş Source Connector işlemi tamamlandı."