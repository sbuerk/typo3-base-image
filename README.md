# TYPO3 Base Image - APACHE2 & PHP-FPM

## Description

This repository provides the build definition for base images
to bundle TYPO3 projects containing webserver and php-fpm in
one image highly customizable with environment variables for
the majority of basic setups keeping the possibility to make
advanced customization in further build steps by replacing
additional configuration files.

## Image variants:

| image-name                         | contains                    |
|------------------------------------|-----------------------------|
| sbuerk/typo3-base-apache2-phpfpm72 | apache2, php(fpm/cli) 7.2.x |
| sbuerk/typo3-base-apache2-phpfpm74 | apache2, php(fpm/cli) 7.4.x |
| sbuerk/typo3-base-apache2-phpfpm80 | apache2, php(fpm/cli) 8.0.x |
| sbuerk/typo3-base-apache2-phpfpm81 | apache2, php(fpm/cli) 8.1.x |
| sbuerk/typo3-base-apache2-phpfpm82 | apache2, php(fpm/cli) 8.2.x |
| sbuerk/typo3-base-apache2-phpfpm83 | apache2, php(fpm/cli) 8.3.x |
| sbuerk/typo3-base-apache2-phpfpm84 | apache2, php(fpm/cli) 8.4.x |


## Image environment variables

All images defines following environment variables, which can be used to configure basic things on the fly when
creating an container based on the image without requiring to execute build steps on it.

| Name                                       | Default Value         | Description                                             |
|--------------------------------------------|-----------------------|---------------------------------------------------------|
| APP_RUN_USER                               | www-data              | Set to user id (id -u) for apache2 and php-fpm process  |
| APP_RUN_GROUP                              | www-data              | Set to group id (id -g) for apache2 and php-fpm process |
| APP_RUN_SERVERNAME                         | localhost             |                                                         |
| APP_ADMIN                                  | webmaster@localhost   |                                                         |
| APACHE2_MPMEVENT_START_SERVERS             | 2                     |                                                         |
| APACHE2_MPMEVENT_MIN_SPARE_THREADS         | 25                    |                                                         |
| APACHE2_MPMEVENT_MAX_SPARE_THREADS         | 75                    |                                                         |
| APACHE2_MPMEVENT_THREAD_LIMIT              | 64                    |                                                         |
| APACHE2_MPMEVENT_THREADS_PER_CHILD         | 25                    |                                                         |
| APACHE2_MPMEVENT_MAX_REQUEST_WORKERS       | 150                   |                                                         |
| APACHE2_MPMEVENT_MAX_CONNECTIONS_PER_CHILD | 0                     |                                                         |
| COMPOSER_ALLOW_SUPERUSER                   | 1                     |                                                         |
| PHPFPM_PM                                  | dynamic               | phpfpm pool                                             |
| PHPFPM_PM_MAX_CHILDREN                     | 5                     | phpfpm pool                                             |
| PHPFPM_PM_START_SERVERS                    | 2                     | phpfpm pool                                             |
| PHPFPM_PM_MIN_SPARE_SERVERS                | 1                     | phpfpm pool                                             |
| PHPFPM_PM_MAX_SPARE_SERVERS                | 3                     | phpfpm pool                                             |
| PHPFPM_PM_MAX_SPAWN_RATE                   | 32                    | phpfpm pool                                             |
| PHPFPM_PROCESS_IDLE_TIMEOUT                | 10s                   | phpfpm pool                                             |
| PHPFPM_PROCESS_IDLE_TIMEOUT                | 10s                   | phpfpm pool                                             |
| PHPFPM_MAX_REQUESTS                        | 0                     | phpfpm pool                                             |
| PHP_INI_SHORT_OPEN_TAG                     | Off                   | cli & fpm php.ini                                       |
| PHP_INI_DEFAULT_TIMEZONE                   | Europe/Berlin         | cli & fpm php.ini                                       |
| PHPFPM_INI_MAX_EXECUTION_TIME              | 300                   | fpm php.ini                                             |
| PHPFPM_INI_MAX_INPUT_TYIME                 | 30                    | fpm php.ini                                             |
| PHPFPM_INI_MEMORYLIMIT                     | 256M                  | fpm php.ini                                             |
| PHPFPM_INI_MAX_INPUT_VARS                  | 2500                  | fpm php.ini                                             |
| PHPFPM_INI_POST_MAX_SIZE                   | 8M                    | fpm php.ini                                             |
| PHPFPM_INI_UPLOADE_MAX_FILESIZE            | 2M                    | fpm php.ini                                             |
| PHPFPM_INI_MAX_FILE_UPLOADS                | 20                    | fpm php.ini                                             |
| PROJECT_FOLDER                             | /var/www/html/project |                                                         |
| PROJECT_DOCROOT                            | /var/www/html/project |                                                         |
