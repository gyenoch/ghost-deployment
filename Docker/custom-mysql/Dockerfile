# Dockerfile for MySQL
FROM mysql:8.0

# Environment variables
ENV MYSQL_ROOT_PASSWORD=example
ENV MYSQL_DATABASE=ghost
ENV MYSQL_USER=ghost
ENV MYSQL_PASSWORD=example

# Copy initialization scripts
COPY ./initdb.d /docker-entrypoint-initdb.d/

EXPOSE 3306
