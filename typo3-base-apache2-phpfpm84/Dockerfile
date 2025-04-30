FROM ubuntu:20.04
ARG TARGETPLATFORM
LABEL org.opencontainers.image.authors="Stefan Bürk <stefan@buerk.tech>"
LABEL org.opencontainers.image.source=https://github.com/sbuerk/typo3-base-image
LABEL org.opencontainers.image.url=https://github.com/sbuerk/typo3-base-image/tree/main#readme
LABEL org.opencontainers.image.description="sbuerk/typo3-base-apache2-phpfpm8.4"

RUN set -x \
# basic exports \
    && export LC_ALL=C \
    && export DEBIAN_FRONTEND=noninteractive \
# Temporarily disable dpkg fsync to make building faster.
    && echo force-unsafe-io > /etc/dpkg/dpkg.cfg.d/docker-apt-speedup \
# Prevent initramfs updates from trying to run grub and lilo.
# https://journal.paul.querna.org/articles/2013/10/15/docker-ubuntu-on-rackspace/
# http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=594189
    && export INITRD=no \
    && mkdir -p /etc/container_environment \
    && echo -n no > /etc/container_environment/INITRD \
# Enable Ubuntu Universe and Multiverse. \
    && sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list \
    && sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list \
    && apt-get update -y \
# Fix some issues with APT packages.
# See https://github.com/dotcloud/docker/issues/1024
    && dpkg-divert --local --rename --add /sbin/initctl \
    && ln -sf /bin/true /sbin/initctl \
# Replace the 'ischroot' tool to make it always return true.
# Prevent initscripts updates from breaking /dev/shm.
# https://journal.paul.querna.org/articles/2013/10/15/docker-ubuntu-on-rackspace/
# https://bugs.launchpad.net/launchpad/+bug/974584
    && dpkg-divert --local --rename --add /usr/bin/ischroot \
    && ln -sf /bin/true /usr/bin/ischroot \
# install packages
    && apt-get install -y --no-install-recommends \
# Install HTTPS support for APT.
        apt-transport-https \
        ca-certificates \
# Install add-apt-repository
        software-properties-common \
# Upgrade all packages.
    && apt-get dist-upgrade -y --no-install-recommends \
# Fix locale.
    && apt-get install -y --no-install-recommends \
        locales-all \
        ^language-pack \
    && locale-gen en_US \
    && update-locale LANG=en_US.UTF-8 LC_CTYPE=en_US.UTF-8 \
    && echo -n en_US.UTF-8 > /etc/container_environment/LANG \
    && echo -n en_US.UTF-8 > /etc/container_environment/LC_CTYPE \
# Install further packages
    && apt-get install -y --no-install-recommends \
            curl \
            bar \
            bash \
            bash-completion \
            less \
            vim \
            psmisc \
            net-tools \
            iputils-ping \
            ncdu \
            dirmngr \
            gpg-agent \
            ack-grep \
            bzip2 \
            pbzip2 \
            patch \
            openssh-client \
            git \
            language-pack-de \
            parallel \
            netcat \
            build-essential \
            libz-dev \
            gnupg \
            openssh-client \
# Add ondrej php ppa
    && LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php \
# Refresh apt and rerun dist upgrade
    && apt-get update -y \
    && apt-get dist-upgrade -y --no-install-recommends \
# Install packages
    && apt-get install -y --no-install-recommends \
# APACHE2 \
            apache2 \
            libapache2-mod-fcgid \
# PHP 8.4
            php8.4 \
            php8.4-apcu \
            php8.4-bcmath \
            php8.4-bz2 \
            php8.4-cli \
            php8.4-common \
            php8.4-curl \
            php8.4-dev \
            php8.4-fpm \
            php8.4-gd \
            php8.4-gmp \
            php8.4-imap \
            php8.4-intl \
            php8.4-ldap \
            php8.4-mbstring \
            php8.4-mysql \
            php8.4-opcache \
            php8.4-pgsql \
            php8.4-pspell \
            php8.4-readline \
            php8.4-soap \
            php8.4-sqlite3 \
            php8.4-xml \
            php8.4-xmlrpc \
            php8.4-xsl \
            php8.4-zip \
# php source / additional extensions
            php-pear \
            php-redis \
            php-memcached \
# image handling tools
            graphicsmagick \
            imagemagick \
            ghostscript \
            graphviz \
# multi-service related tools \
            supervisor \
# database releated \
            mariadb-client \
# additional packages
            re2c \
            xz-utils \
            zip \
            unzip \
            sqlite3 \
            jq \
# set default php files \
    && update-alternatives --set php /usr/bin/php8.4 \
# Enable phar writing \
    && sed -i s/';phar.readonly = On'/'phar.readonly = Off'/ /etc/php/8.4/cli/php.ini \
# Restrict cli based php.ini settings for php -S web server to have sane values in acceptance tests
    && sed -i s/'memory_limit = -1'/'memory_limit = 2G'/ /etc/php/8.4/cli/php.ini \
    && sed -i s/'max_execution_time = 30'/'max_execution_time = 240'/ /etc/php/8.4/cli/php.ini \
    && sed -i s/'; max_input_vars = 1000'/'max_input_vars = 1500'/ /etc/php/8.4/cli/php.ini \
# Enable apc on cli for unit tests \
    && echo "apc.enable_cli=1" >> /etc/php/8.4/mods-available/apcu.ini \
    && echo "apc.slam_defense=0" >> /etc/php/8.4/mods-available/apcu.ini \
# Install composer 2.x
    && curl -sSL https://getcomposer.org/download/latest-2.x/composer.phar -o /usr/bin/composer \
    && chmod +x /usr/bin/composer \
# create structure \
    && mkdir -p /var/www/html/project \
    && mkdir -p /var/www/html/shared \
    && chown -R www-data:www-data /var/www/html/project \
    && chown -R www-data:www-data /var/www/html/shared \
    && chmod -R 777 /var/www/html \
# ensure run folder for php-fpm socket file \
    && mkdir -p /run/php \
    && chmod -R a+rw /run/php \
# create log folders \
    && mkdir -p /var/log/supervisor \
    && chmod -R a+rw /var/log \
# Arbitrary user needs to be able to bind to privileged ports
    && setcap CAP_NET_BIND_SERVICE=+eip /usr/sbin/apache2 \
# Cleanup \
    && apt-get remove -y --purge \
           autoconf \
           autotools-dev \
           build-essential \
           file \
           libtool \
           php8.4-dev \
    && apt-get clean \
    && apt-get -y autoremove \
    && rm -Rf /var/lib/apt/lists/* \
    && rm -Rf \
        /pd_build \
        /tmp/* \
        /var/tmp/* \
        /etc/dpkg/dpkg.cfg.d/docker-apt-speedup \
        /var/lib/apt/lists/* \
        /root/.npm/ \
        /usr/local/src/* \
# Some outputs
    && php -v \
    && php -m

# Copy all configuration files (override existing files
COPY ./etc/ /etc/
COPY entrypoint.sh /usr/local/bin

# finish configuraiton
RUN set -x \
    && chmod a+x /usr/local/bin/entrypoint.sh \
    && a2dismod mpm_prefork \
    && a2enmod mpm_event \
    && a2enmod \
        actions \
        rewrite \
        headers \
        setenvif \
        proxy \
        proxy_fcgi \
    && a2enconf servername \
    && echo "$( apachectl -M | grep 'mpm' )" \
    && echo "$( apachectl -M | grep 'proxy' )"

ENV APP_RUN_USER="www-data" \
    APP_RUN_GROUP="www-data" \
    APP_RUN_SERVERNAME="localhost" \
    APP_ADMIN="webmaster@localhost" \
    APACHE2_MPMEVENT_START_SERVERS=2 \
    APACHE2_MPMEVENT_MIN_SPARE_THREADS=25 \
    APACHE2_MPMEVENT_MAX_SPARE_THREADS=75 \
    APACHE2_MPMEVENT_THREAD_LIMIT=64 \
    APACHE2_MPMEVENT_THREADS_PER_CHILD=25 \
    APACHE2_MPMEVENT_MAX_REQUEST_WORKERS=150 \
    APACHE2_MPMEVENT_MAX_CONNECTIONS_PER_CHILD=0 \
    COMPOSER_ALLOW_SUPERUSER=1 \
    PHPFPM_PM="dynamic" \
    PHPFPM_PM_MAX_CHILDREN=5 \
    PHPFPM_PM_START_SERVERS=2 \
    PHPFPM_PM_MIN_SPARE_SERVERS=1 \
    PHPFPM_PM_MAX_SPARE_SERVERS=3 \
    PHPFPM_PM_MAX_SPAWN_RATE=32 \
    PHPFPM_PROCESS_IDLE_TIMEOUT="10s" \
    PHPFPM_FPM_MEMORYLIMIT="256M" \
    PHPFPM_MAX_REQUESTS=0 \
    PROJECT_FOLDER="/var/www/html/project" \
    PROJECT_DOCROOT="/var/www/html/project"

VOLUME /var/www/html/shared
EXPOSE 80

WORKDIR /var/www/html/project

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD [ "/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf" ]