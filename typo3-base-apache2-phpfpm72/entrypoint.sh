#!/bin/bash

echo '>> Changing user/group for files'
APP_RUN_USER="${APP_RUN_USER:-www-data}"
APP_RUN_GROUP="${APP_RUN_GROUP:-www-data}"
PROJECT_FOLDER="${PROJECT_FOLDER:-/var/www/html/project}"
if [ ${APP_RUN_USER} != "www-data" ]; then
  if [ $(getent passwd typo3) ]; then
    echo "user 'typo3' exists."
  else
    if [ ${APP_RUN_GROUP} != "www-data" ]; then
      if [ $(getent group typo3) ]; then
        echo "group 'typo3' exists."
      else
        echo "group 'typo3' does not exist."
        addgroup typo3 --gid=${APP_RUN_GROUP};
      fi
    fi
    echo "user 'typo3' does not exist."
    adduser --home ${PROJECT_FOLDER} --shell /bin/bash --no-create-home --disabled-login --ingroup typo3 --gecos GECOS --uid ${APP_RUN_USER} typo3
    echo -n "change user/group for folders ..."
    chown -R --silent ${APP_RUN_USER}:${APP_RUN_GROUP} /var/www/html
    echo "done"
  fi
fi

exec "$@"
