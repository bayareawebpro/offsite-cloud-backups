#!/usr/bin/env bash
$(which mysqldump) --single-transaction --no-create-db --quick --default-character-set=utf8mb4 $1 > $2/$1-latest.sql;