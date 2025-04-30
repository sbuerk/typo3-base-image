#!/usr/bin/env bash

if [[ "$1" == "/usr/bin/supervisord" ]]; then
  echo '>> Changing user/group for files'
  APP_RUN_USER="${APP_RUN_USER:-www-data}"
  APP_RUN_GROUP="${APP_RUN_GROUP:-www-data}"
  PROJECT_FOLDER="${PROJECT_FOLDER:-/var/www/html/project}"
  chown -R ${APP_RUN_USER}:${APP_RUN_GROUP} ${PROJECT_FOLDER}
  chown -R ${APP_RUN_USER}:${APP_RUN_GROUP} /var/www/html
  addgroup typo3 --gid=${APP_RUN_GROUP}
  adduser -h ${PROJECT_FOLDER} -D -G typo3 --uid=${APP_RUN_USER} typo3;
  exec "$@"
fi

if [[ "$( id -u )" -eq 0 ]]; then
  su - typo3 -c "/usr/local/bin/entrypoint.sh $@"
else
  exec "$@"
fi