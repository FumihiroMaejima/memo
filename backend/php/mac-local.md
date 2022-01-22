# PHP - mac local env

---

# Install PHP

## check installable vaersion

```shell-sesshion
$ brew search php@7
==> Formulae
php@7.2                               php@7.3                               php@7.4
==> Casks
homebrew/cask/eclipse-php                                homebrew/cask/netbeans-php

$ brew search php@8
==> Formulae
php@8.0 ✔
==> Casks
homebrew/cask/eclipse-php                                homebrew/cask/netbeans-php
~ $
```

if you would install `v8.0`

```shell-sesshion
$ brew install php@8.0
```

## edit ~/.bash_profile & reload

for PATH setting & composer setting.

```shell-sesshion
$ echo 'export PATH="/usr/local/opt/apr/bin:$PATH"' >> ~/.bash_profile
$ echo 'alias composer="php -d memory_limit=-1 /usr/local/bin/composer"' >> ~/.bash_profile
$ source ~/.bash_profile
```

## start PHP service

```shell-sesshion
$ brew services start php
==> Successfully started `php` (label: homebrew.mxcl.php)
```

```shell-sesshion
$ php -v
PHP 8.0.0 (cli) (built: Nov 30 2020 13:47:29) ( NTS )
Copyright (c) The PHP Group
Zend Engine v4.0.0-dev, Copyright (c) Zend Technologies
    with Zend OPcache v8.0.0, Copyright (c), by Zend Technologies
```


---

# Update PHP

update for minor update.

```shell-sesshion
$ brew upgrade php
```

---


# Use Not Latest Version PHP

reset symbric link.

```shell-sesshion
$ brew search php@8
==> Formulae
php@8.0                                       php ✔
```

```shell-sesshion
$ brew install php@8.0
```

`php`と`php-fpm`のパスの確認
シンボリックリンクの為、元のファイルの場所も確認する。

```shell-sesshion
$ which php
/opt/homebrew/bin/php

$ ls -al /opt/homebrew/bin/php
lrwxr-xr-x  1 user  group  27  1 16 00:20 /opt/homebrew/bin/php -> ../Cellar/php/8.1.1/bin/php

$ which php-fpm
/opt/homebrew/sbin/php-fpm

$ ls -al /opt/homebrew/bin/php
lrwxr-xr-x  1 user  group  27  1 16 00:20 /opt/homebrew/php-fpm -> ../Cellar/php/8.1.1/sbin/php-fpm
```

インストールしたPHP v8.0系は下記にある、シンボリックリンクをこちらに貼り直すことでバージョンを変更出来る。

```shell-sesshion
/opt/homebrew/Cellar/php@8.0/8.0.15/bin/php
/opt/homebrew/Cellar/php@8.0/8.0.15/sbin/php-fpm
```

インストールしたPHP v8.0系は下記にある、シンボリックリンクをこちらに貼り直すことでバージョンを変更出来る。

```shell-sesshion
# unlink
$ unlink /opt/homebrew/bin/php
$ unlink /opt/homebrew/sbin/php-fpm

# make symbplic link
$ ln -svf /opt/homebrew/Cellar/php@8.0/8.0.15/bin/php /opt/homebrew/bin/php
$ ln -svf /opt/homebrew/Cellar/php@8.0/8.0.15/sbin/php-fpm /opt/homebrew/sbin/php-fpm
```

最新のバージョンを使いたい場合は元のパスでシンボリックリンクを作成する。

```shell-sesshion
# unlink

# make symbplic link
$ ln -svf /opt/homebrew/Cellar/php/8.1.1/bin/php /opt/homebrew/bin/php
$ ln -svf /opt/homebrew/Cellar/php/8.1.1/sbin/php-fpm /opt/homebrew/sbin/php-fpm
```

---

# Install Composer

## install openssl

```shell-session
$ brew install openssl
```

## install Composer

```shell-session
$ curl -sS https://getcomposer.org/installer | php
```

## move to `/usr/local/bin/`

```shell-session
$ ls
composer.phar
$ mv composer.phar /usr/local/bin/composer
```

```shell-session
$ composer --version
Composer version 1.10.4 2020-04-09 17:05:50
```

---

# Upgrade Composer

## self-update command

```shell-sesshion
$ composer self-update
Updating to version 2.0.8 (stable channel).
   Downloading (100%)
Deprecation Notice: Function openssl_free_key() is deprecated in phar:///usr/local/bin/composer/src/Composer/Command/SelfUpdateCommand.php:240
Use composer self-update --rollback to return to version 1.10.4
~ $ composer --version
Composer version 2.0.8 2020-12-03 17:20:38
```


## down grade

```shell-sesshion
$ composer self-update --rollback to return to version 1.10.4
```

---

