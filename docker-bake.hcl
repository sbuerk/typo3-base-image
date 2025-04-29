
target "docker-metadata-action" {}

target "typo3-base-apache2-phpfpm74" {
  inherits = ["docker-metadata-action"]
  context = "./typo3-base-apache2-phpfpm74"
  platforms = ["linux/amd64", "linux/arm64"]
}