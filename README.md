# Engage - Multi-site docker

In some cases you or your team don't want to use many docker containers while development.

## Getting started

Checkout this repository:

```bash
$ git clone https://github.com/mbunge/multi-site-docker.git
``` 

Copy .env.example and and name it .env file in the same directory as docker-compose.yml.

```bash
cp .env.example .env
```

Test config before start

```bash
docker-compose config
```

Create and start all containers

```bash
$ docker-compose up -d engage
```

Stop all containers

```bash
docker-compose stop
```

Stop all containers

```bash
docker-compose start
```

Stop and remove all containers

```bash
$ docker-compose down
```

## Features

- Nginx
- PHP (FPM) 5.6, 7.0, 7.1
- MySQL 5.5, 5.6, 5.7, 8.0

Designed for multi-site development. 

## How to's

### Change location of your projects

Change `SITES_FOLDER` to your projects in `.env`.
 
#### Example

```
SITES_FOLDER=../
```

### Change PHP version


Change `PHP_VERSION` in `.env` in to one of the following:

 - 5.6
 - 7.0
 - 7.1

For detailed information about used PHP-Images please the all [php-fpm-xdebug images](https://hub.docker.com/r/prooph/php/) powerd by [prooph](https://hub.docker.com/r/prooph/).

### Change MySQL Version

Change `MYSQL_VERSION` in `.env` in to one of the following:

 - 5.5
 - 5.5.54
 - 5.6
 - 5.6.35
 - 5.7
 - 5.7.17 (aliases 5 and latest)
 - 8.0 (aliases 8.0.0 and 8)
 
Please keep in mind, changing the version could corrupt the databases or MySQL is not able to use databases.

### Change additional MySQL data

You could also change defaults for you MySQL instance in `.env` with all `MYSQL_*` variables like the default database `MYSQL_DATABASE`.

### Extend `docker-compose.yml`
 
In some cases you need to adjust default configurations, like ports or something else. Instead of change values in 
`docker-compose.yml`, add `docker-compose.overwrite.yml` which is overwriting values in default config.

### Add a new site

Go to `sites/` and add a new folder, for example:
```sh
$ mkdir -P sites/my-awesome-project/public
```

`public/` is the place for your `index.php`. Keep your host file in mind. The sites folder `my-awesome-project` is mapped to domain. You need to add `my-awesome-project` to your hosts and your project will be available via `http://my-awesome-project`.

### Add an additional nginx conf

Go to `machine/nginx/sites-enabled`, copy `site.conf.example` and set up your custom config

### Connect to MySQL

#### From host

If you use tools like SQuirreL, DataGrip, etc. you may want to connect to from host. The host is 127.0.0.1 by default. 
Username, password and port are the same as configured in `docker-compose.yml`.
  
#### From container

Inside of your container the hostanme to MySQL is database, similar to the service name. Just execute following code 
and you are connected.

```php
<?php

$dbh = new PDO(
    'mysql:host=database;port=3306;dbname=agantty_app;charset=UTF8;',
    'root',
    'dev', 
    [
        PDO::ATTR_PERSISTENT=>true
    ]
);

var_dump($db->query('SHOW TABLES')->fetchAll());

```

### Connect to services

#### Nginx
```bash
$ docker-compose exec nginx bash
```
#### PHP
```bash
$ docker-compose exec php bash
```
#### MySQL
```bash
$ docker-compose exec database bash
```
#### Data
```bash
$ docker-compose exec dataphp bash
```

### Execute composer and other CLI tools

#### Composer

For composer we recomment this [awesome docker container](https://hub.docker.com/r/prooph/composer/) which is executing composer in your desired PHP version.

#### Artisan and friends

This is very easy. Execute your commands from following pattern:

```bash
$ docker-compose exec php php [param1] [param2] [paramN]
```

For example migrate database with artisan:

```bash
$ docker-compose exec php php my-awesome-project/artisan migrate
```

## Change log

Please see [CHANGELOG](CHANGELOG.md) for more information what has changed recently.

## Contributing

Please see [CONTRIBUTING](CONTRIBUTING.md) for details.

## Issues and more help

Use the [issue tracker](https://github.com/mbunge/multi-site-docker/issues) and we will help you!

## Credits

- [Marco Bunge](https://github.com/mbunge)
- [All contributors](https://github.com/mbunge/multi-site-docker/graphs/contributors)

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
