#!/bin/sh

~/bin/apb-docker-run.sh prepare
~/bin/apb-docker-run.sh build
~/bin/apb-docker-run.sh push
