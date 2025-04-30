
target "docker-metadata-action" {}

target "typo3-base-apache2-phpfpm72" {
  inherits = ["docker-metadata-action"]
  context = "./typo3-base-apache2-phpfpm72"
  platforms = ["linux/amd64", "linux/arm64"]
}

target "typo3-base-apache2-phpfpm74" {
  inherits = ["docker-metadata-action"]
  context = "./typo3-base-apache2-phpfpm74"
  platforms = ["linux/amd64", "linux/arm64"]
}

target "typo3-base-apache2-phpfpm80" {
  inherits = ["docker-metadata-action"]
  context = "./typo3-base-apache2-phpfpm80"
  platforms = ["linux/amd64", "linux/arm64"]
}

target "typo3-base-apache2-phpfpm81" {
  inherits = ["docker-metadata-action"]
  context = "./typo3-base-apache2-phpfpm81"
  platforms = ["linux/amd64", "linux/arm64"]
}