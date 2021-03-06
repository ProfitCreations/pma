#!/bin/bash

echo 'Downloading phpMyAdmin 4.6.3'
curl -#L https://files.phpmyadmin.net/phpMyAdmin/4.6.3/phpMyAdmin-4.6.3-english.tar.gz -o phpmyadmin.tar.gz

mkdir phpmyadmin && tar xf phpmyadmin.tar.gz -C phpmyadmin --strip-components 1

rm phpmyadmin.tar.gz

CMD=/vendor/laravel/homestead/scripts/serve-laravel.sh
if [ ! -f $CMD ]; then
    # fallback for older versions
    CMD=/vendor/laravel/homestead/scripts/serve-laravel.sh
fi

sudo bash $CMD phpmyadmin.app $(pwd)/phpmyadmin
