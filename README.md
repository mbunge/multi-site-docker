# Multi-site docker

In some cases you or your team don't want to use many docker containers while development. Multisite docker

## Getting started

Checkout this repository

```bash
git clone https://github.com/mbunge/multi-site-docker.git
``` 

Up and running

```bash
docker-compose up -d engage
```

And stop it

```bash
docker-compose down
```

## Features

- Nginx
- PHP (FPM)
- MySQL

Designed for multi-site development. 

## How to's

### Change location of your projects

Change path to your projects in `docker-compose.yml` on line 40. Replace `- ./sites:/var/www` with `-../your-path:/var/www` 

### Change PHP-Version

Go to docker-compose.yml and change `image` with your desired php-image. We prefer php fpm xdebug images provided by 
prooph for development.
 
### Add a new site

Go to `sites/` and add a new folder `mkdir -P sites/my-awesome-project/public`. `public/` is the place for your 
`index.php`. Keep your host file in mind. The sites folder `my-awesome-project` is mapped to domain. You need to add 
`my-awesome-project` to your hosts and your project will be available via `http://my-awesome-project`.

### Add an additional nginx conf

Go to `machine/nginx/sites-enabled`, copy `site.conf.example` and write your custom config

### Connect to MySQL

#### From host

If you use tools like SQuirreL, DataGrip, etc. you may want to connect to from host. The host is 127.0.0.1 by default. 
Username, password an port are the same as configured in `docker-compose.yml`.
  
#### From container

Inside of your container the hostanme to MySQL is database, similar to the service name. Just execute following code 
and you are connected.

```php
<?php

$db = new PDO(
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

`docker-compose exec nginx bash`

#### PHP

`docker-compose exec php bash`

#### MySQL

`docker-compose exec database bash`

#### Data

`docker-compose exec dataphp bash`

### Execute composer and other cli tools

#### Composer

For composer we recomment this [awesome docker container](https://hub.docker.com/r/prooph/composer/) which is executing composer in your desired PHP-Version.

#### Artisan and friends

This is very easy. Execute your commands from following pattern

```
docker-compose exec php php [param1] [param2] [paramN]
```

For example migrate database with artisan 

```
docker-compose exec php php my-awesome-project/artisan migrate
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
