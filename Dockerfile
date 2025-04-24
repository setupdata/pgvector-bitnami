ARG PG_MAJOR=17

FROM pgvector/pgvector:pg${PG_MAJOR} AS builder

ARG PG_MAJOR
FROM bitnami/postgresql:${PG_MAJOR}

ARG PG_MAJOR
COPY --from=builder /usr/lib/postgresql/${PG_MAJOR}/lib/vector.so /opt/bitnami/postgresql/lib/
COPY --from=builder /usr/share/postgresql/${PG_MAJOR}/extension/vector* /opt/bitnami/postgresql/share/extension/
