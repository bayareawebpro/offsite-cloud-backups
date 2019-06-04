#!/usr/bin/env bash
$(which mysqldump) --single-transaction --no-create-db --quick $1 > "/home/forge/snapshots/$1-latest.sql";