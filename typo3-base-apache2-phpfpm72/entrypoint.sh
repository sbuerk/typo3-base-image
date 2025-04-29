#!/usr/bin/env sh

if [[ "$1" == "/usr/bin/supervisord" ]]; then
  APP_RUN_USER="${APP_RUN_USER:-www-data}"
  APP_RUN_GROUP="${APP_RUN_GROUP:-www-data}"
  PROJECT_FOLDER="${PROJECT_FOLDER:-/var/www/html/project}"
  chmod -R ${APP_RUN_USER}:${APP_RUN_GROUP} ${PROJECT_FOLDER}
  chmod -R ${APP_RUN_USER}:${APP_RUN_GROUP} ${PROJECT_FOLDER}
fi

exec "$@"