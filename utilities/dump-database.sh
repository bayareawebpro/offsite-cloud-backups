#!/usr/bin/env bash
$(which mysqldump) --single-transaction --no-create-db --quick $1 > $2/$1-latest.sql;

#mysql_config_editor set --login-path=local --host=localhost --user=bayareaweb --password