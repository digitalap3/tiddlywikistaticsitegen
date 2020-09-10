#!/bin/bash

nohup tiddlywiki  --listen host=0.0.0.0 username=username password=password "readers=(anon)" > twserverup.out &
