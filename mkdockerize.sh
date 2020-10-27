#!/bin/bash

Manual() {
  echo "run example"
  echo "create Mkdocs project: docker run <arguments> <docker-image-name> produce"
  echo "docker run -p 8000:8000 <arguments> <docker-image-name> serve"
}

#debug
echo $1
echo $MK_PATH

if [[ $1 == 'produce' ]];
then
  echo "arg = produce"
elif [[ $1 == 'serve' ]];
then
  echo "arg = serve"
else
  Manual
fi
