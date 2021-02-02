rm -f latest.dump
heroku pg:backups:capture
heroku pg:backups:download
rails db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1
rails db:create
rails db:migrate
pg_restore --verbose --clean --no-acl --no-owner -d impulse_development latest.dump
