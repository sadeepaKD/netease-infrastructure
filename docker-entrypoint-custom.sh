#!/bin/bash
# docker-entrypoint-custom.sh
# Enables SQL module and configures FreeRADIUS to use it for auth/acct
# Runs BEFORE FreeRADIUS starts, using the container's built-in config as a base

set -e

RADDB="/etc/freeradius"

# 1. Enable the SQL module (create symlink if not already present)
if [ ! -e "$RADDB/mods-enabled/sql" ]; then
    ln -s "$RADDB/mods-available/sql" "$RADDB/mods-enabled/sql"
    echo "[netease] Enabled sql module"
fi

# 2. Uncomment 'sql' references in sites-available/default so SQL is used
#    for authorization, accounting, session, and post-auth
sed -i 's/^#[[:space:]]*sql$/        sql/' "$RADDB/sites-available/default"
sed -i 's/^#[[:space:]]*-sql$/        -sql/' "$RADDB/sites-available/default"
echo "[netease] Uncommented sql in sites-available/default"

# 3. Uncomment 'sql' references in sites-available/inner-tunnel
sed -i 's/^#[[:space:]]*sql$/        sql/' "$RADDB/sites-available/inner-tunnel"
sed -i 's/^#[[:space:]]*-sql$/        -sql/' "$RADDB/sites-available/inner-tunnel"
echo "[netease] Uncommented sql in sites-available/inner-tunnel"

echo "[netease] Custom configuration complete, starting FreeRADIUS..."

# 4. Start FreeRADIUS (exec replaces this script with the actual process)
exec freeradius -f
