#!/usr/bin/env bash

if [[ "$1" == "/usr/bin/supervisord" ]]; then
  echo '>> Changing user/group for files'
  APP_RUN_USER="${APP_RUN_USER:-www-data}"
  APP_RUN_GROUP="${APP_RUN_GROUP:-www-data}"
  PROJECT_FOLDER="${PROJECT_FOLDER:-/var/www/html/project}"
  chown -R ${APP_RUN_USER}:${APP_RUN_GROUP} ${PROJECT_FOLDER}
  chown -R ${APP_RUN_USER}:${APP_RUN_GROUP} /var/www/html
fi

exec "$@"