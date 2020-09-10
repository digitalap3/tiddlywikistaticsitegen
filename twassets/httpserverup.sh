#!/bin/bash

cd ./myblog/output
nohup httpserver -H 0.0.0.0 -p 8081 > ../httpserver.out &
