FROM postgres:17

ENV PGDATA="/var/lib/postgresql/data/pgdata"
ENV PGHOST="${{RAILWAY_TCP_PROXY_DOMAIN}}"
ENV PGPORT="${{RAILWAY_TCP_PROXY_PORT}}"
ENV POSTGRES_DB="railway"
ENV DATABASE_URL="postgres://${{POSTGRES_USER}}:${{POSTGRES_PASSWORD}}@${{PGHOST}}:${{PGPORT}}/${{POSTGRES_DB}}"
ENV POSTGRES_USER="railway"
ENV SSL_CERT_DAYS="820"
ENV PGHOST_PRIVATE="${{RAILWAY_PRIVATE_DOMAIN}}"
ENV PGPORT_PRIVATE="5432"
ENV POSTGRES_PASSWORD="${{secret(32, "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_!~*")}}"
ENV DATABASE_PRIVATE_URL="postgres://${{POSTGRES_USER}}:${{POSTGRES_PASSWORD}}@${{PGHOST_PRIVATE}}:${{PGPORT_PRIVATE}}/${{POSTGRES_DB}}"

VOLUME ["/var/lib/postgresql/data"]

CMD ["postgres", "-c", "max_connections=200", "-c", "wal_level=minimal", "-c", "max_wal_senders=0", "-c", "port=5432"]
