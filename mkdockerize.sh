#!/bin/bash

Manual() {
  echo "run example"
  echo "create Mkdocs project: docker run <arguments> <docker-image-name> produce"
  echo "docker run -p 8000:8000 <arguments> <docker-image-name> serve"
}

# if arg 1 is produce, produce mkdocs project then return it's .tar.gz file
# after creating .tar.gz, remove site dir
if [[ $1 == 'produce' ]];
then
  cd $MKPATH
  mkdocs build --quiet
  cd ..
  tar -zcvf .tar.gz -C $MKPATH .
  rm -rf $MKPATH/site
  mv .tar.gz $MKPATH
elif [[ $1 == 'serve' ]];
then
  echo "serve!"
else
  Manual
fi
