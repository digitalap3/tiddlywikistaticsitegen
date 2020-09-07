#!/bin/bash

cd ./myblog/output
nohup http-server -a 0.0.0.0 -p 8081 > ../httpserver.out &
