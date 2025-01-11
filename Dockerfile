FROM postgres:17

# Configurações do PostgreSQL
ENV POSTGRES_PASSWORD=AU2KI3RkPKYVh1k5yvZE1rQ8
ENV POSTGRES_INITDB_ARGS="--auth-host=scram-sha-256"

CMD ["postgres", "-c", "max_connections=200", "-c", "wal_level=minimal", "-c", "max_wal_senders=0", "-c", "port=5432"]