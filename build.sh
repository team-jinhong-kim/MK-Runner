#! /bin/bash

docker run -v /Users/jinhongkim/projects/MK-Runner/project:/app/project -e MKPATH=/app/project test produce > ./project/.tar.gz
