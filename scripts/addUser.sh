#!/bin/bash

mysql -e  mysql -e 'CREATE USER jbu@jkbautovm IDENTIFIED BY "$1";GRANT ALL PRIVILEGES ON *.* TO jbu@jkbautovm WITH GRANT OPTION;'