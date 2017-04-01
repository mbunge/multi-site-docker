# Changelog

## 1.0.5

### Added

 - Provide helpers for Composer and docker usage
 
### Altered
 
 - lesser strict MySQL sql-mode

### Removed

 - Remove xdbug by default for better performance

## 1.0.4

PHP-Unitsupport with MySQL in mind

### Added

 - Add PHP-Unit build

## 1.0.3

More configuration options for PHP and MySQL

### Altered

 - Exchange PHP Image for advanced customization of php.ini, php_fpm.conf and php modules inside docker-compose.yml
 - Extend mysql cnf and remove `ONLY_FULL_GROUP_BY, ZERO_IN_DATE, ZERO_DATE` options for compatibility of Laravel 4 and Wordpress

## 1.0.2

### Added

 - Provide environment files to provide better customization support

### Altered

 - Adjust php test files
 - add `alpine:latest` as default data container for a smaller footprint

## 1.0.1

### Fix

 - Change start_dependencies to engange as mentioned in docs

## 1.0.0

 - Setup Nginx, PHP, MySQL stack
 - Keep dependecies in mind
 - Services are waiting for dependencies until they are really ready 
