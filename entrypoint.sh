#!/bin/bash
set -e

# Initialize PgAdmin if first run
if [ ! -f /var/lib/pgadmin/pgadmin4.db ]; then
    echo "Setting up PgAdmin"
    /usr/pgadmin4/bin/setup-web.sh --yes
fi

# Render runs on PORT env variable
export PGADMIN_LISTEN_PORT=${PORT:-80}

echo "Starting PgAdmin on port $PORT"
/usr/pgadmin4/bin/pgadmin4
