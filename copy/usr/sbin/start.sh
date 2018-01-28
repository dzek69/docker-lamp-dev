#!/bin/bash

/usr/bin/mysqld_safe &
/usr/sbin/apachectl -DFOREGROUND -k start