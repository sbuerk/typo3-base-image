
target "docker-metadata-action" {}

target "typo3-base-apache2-phpfpm72" {
  inherits = ["docker-metadata-action"]
  context = "./typo3-base-apache2-phpfpm72"
  # linux/arm64 is disabled for now: the PHP security patch for CVE-2026-109618 and CVE-2026-109619
  # is not yet available for arm64 on packages.sury.org.
  platforms = ["linux/amd64"]
}

target "typo3-base-apache2-phpfpm74" {
  inherits = ["docker-metadata-action"]
  context = "./typo3-base-apache2-phpfpm74"
  # linux/arm64 is disabled for now: the PHP security patch for CVE-2026-109618 and CVE-2026-109619
  # is not yet available for arm64 on packages.sury.org.
  platforms = ["linux/amd64"]
}

target "typo3-base-apache2-phpfpm80" {
  inherits = ["docker-metadata-action"]
  context = "./typo3-base-apache2-phpfpm80"
  # linux/arm64 is disabled for now: the PHP security patch for CVE-2026-109618 and CVE-2026-109619
  # is not yet available for arm64 on packages.sury.org.
  platforms = ["linux/amd64"]
}

target "typo3-base-apache2-phpfpm81" {
  inherits = ["docker-metadata-action"]
  context = "./typo3-base-apache2-phpfpm81"
  # linux/arm64 is disabled for now: the PHP security patch for CVE-2026-109618 and CVE-2026-109619
  # is not yet available for arm64 on packages.sury.org.
  platforms = ["linux/amd64"]
}

target "typo3-base-apache2-phpfpm82" {
  inherits = ["docker-metadata-action"]
  context = "./typo3-base-apache2-phpfpm82"
  # linux/arm64 is disabled for now: the PHP security patch for CVE-2026-109618 and CVE-2026-109619
  # is not yet available for arm64 on packages.sury.org.
  platforms = ["linux/amd64"]
}

target "typo3-base-apache2-phpfpm83" {
  inherits = ["docker-metadata-action"]
  context = "./typo3-base-apache2-phpfpm83"
  # linux/arm64 is disabled for now: the PHP security patch for CVE-2026-109618 and CVE-2026-109619
  # is not yet available for arm64 on packages.sury.org.
  platforms = ["linux/amd64"]
}

target "typo3-base-apache2-phpfpm84" {
  inherits = ["docker-metadata-action"]
  context = "./typo3-base-apache2-phpfpm84"
  # linux/arm64 is disabled for now: the PHP security patch for CVE-2026-109618 and CVE-2026-109619
  # is not yet available for arm64 on packages.sury.org.
  platforms = ["linux/amd64"]
}