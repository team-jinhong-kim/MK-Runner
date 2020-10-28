#! /bin/bash

docker run -v /Users/jinhongkim/projects/MK-Runner/project:/app/project -e MKPATH=/app/project test produce | docker run -p 8000:8000 -v /Users/jinhongkim/projects/MK-Runner/project:/app/project -e MKPATH=/app/project -i test serve
