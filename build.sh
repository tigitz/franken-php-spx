#!/bin/bash

set -ex

rsync -av --progress ../php-spx .tmp --exclude .git
docker build -t frankenphp-spx .
