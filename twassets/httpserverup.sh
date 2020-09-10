#!/bin/bash

cd ./output
nohup httpserver -H 0.0.0.0 -p 8081 > ../httpserver.out &
