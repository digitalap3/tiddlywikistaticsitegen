#!/bin/bash

nohup tiddlywiki ./myblog --listen host=0.0.0.0 username=username password=password "readers=(anon)" > twserverup.out &
