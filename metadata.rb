name             "modules"
maintainer       "Allan Espinosa"
maintainer_email "allan.espinosa@outlook.com"
license          "Apache 2.0"
description      "Installs/Configures modules"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"
depends          "ark"
depends          "build-essential"
recipe           "default", "Provides the modulefile resource"
recipe           "source", "Downloads and installs environment-modules"
