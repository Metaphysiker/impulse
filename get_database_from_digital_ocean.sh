#!/bin/bash
ssh sandro@159.65.120.231 << EOF
  cd impulse
  pg_dump impulse_production > latest.sql
EOF

scp sandro@159.65.120.231:/home/sandro/impulse/latest.sql latest.sql

rails db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1
rails db:create
#rails db:migrate

psql impulse_development < latest.sql
