FROM python:3.12-slim

# Install system dependencies
RUN apt-get update && \
    apt-get install -y wget gnupg && \
    wget -qO - https://www.pgadmin.org/static/packages_pgadmin_org.pub | apt-key add - && \
    echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && \
    apt-get update && \
    apt-get install -y pgadmin4-web && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Setup pgAdmin configuration
COPY config_local.py /usr/pgadmin4/web/
COPY entrypoint.sh /entrypoint.sh

# Render requires an executable entrypoint
RUN chmod +x /entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]