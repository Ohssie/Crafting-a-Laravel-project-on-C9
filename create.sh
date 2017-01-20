#!/bin/bash

function upgradingPhp {
    sudo add-apt-repository ppa:ondrej/php
    sudo apt-get update
    sudo apt-get install libapache2-mod-php5.6
    sudo a2dismod php5
    sudo a2enmod php5.6
    sudo add-apt-repository ppa:ondrej/php5-compat
    sudo apt-get update
    sudo apt-get dist-upgrade
}
upgradingPhp

function craftProject {
    rm README.md php.ini hello-world.php
    sudo composer global require 'laravel/installer'
    export PATH=~/.composer/vendor/bin:$PATH
    laravel new laravel
    shopt -s dotglob
    mv laravel/* ./
    rm -rf laravel
}
craftProject
