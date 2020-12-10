#!/usr/bin/env bash

kill $(ps aux | grep PM2 | head -n 1 | xargs | cut -d' ' -f2)
