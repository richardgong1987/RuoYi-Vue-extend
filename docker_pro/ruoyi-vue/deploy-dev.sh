#!/bin/bash

set -eu

cp -f ../../ruoyi-admin/target/ruoyi-admin.jar ./app.jar

docker-compose build && docker-compose push
