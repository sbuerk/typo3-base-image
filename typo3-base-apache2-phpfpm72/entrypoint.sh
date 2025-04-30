#!/usr/bin/env bash

if [[ "$1" == "/usr/bin/supervisord" ]]; then
  echo '>> Changing user/group for files'
  APP_RUN_USER="${APP_RUN_USER:-www-data}"
  APP_RUN_GROUP="${APP_RUN_GROUP:-www-data}"
  PROJECT_FOLDER="${PROJECT_FOLDER:-/var/www/html/project}"
  addgroup typo3 --gid=${APP_RUN_GROUP};
  adduser --home ${PROJECT_FOLDER} --shell /bin/bash --no-create-home --disabled-login --ingroup typo3 --gecos GECOS --uid ${APP_RUN_USER} typo3;
  chown -R ${APP_RUN_USER}:${APP_RUN_GROUP} ${PROJECT_FOLDER}
  chown -R ${APP_RUN_USER}:${APP_RUN_GROUP} /var/www/html
  exec "$@"
fi

if [[ "$( id -u )" -eq 0 ]]; then
  # su behaves inconsistently with -c followed by flags
  # Workaround: run the entrypoint and commands as a standalone script
  echo "#!/usr/bin/env bash" > /usr/local/bin/invocation.sh
  echo >> /usr/local/bin/invocation.sh
  for ARG in "$@"; do
      printf "${ARG} " >> /usr/local/bin/invocation.sh
  done
  chmod a+x /usr/local/bin/invocation.sh

  su typo3 -l -P -c "/usr/local/bin/invocation.sh"

else
  exec "$@"
fi
