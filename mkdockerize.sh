#!/bin/bash

Manual() {
  echo "run example"
  echo "create Mkdocs project: docker run <arguments> <docker-image-name> produce <output path(.tar.gz)>"
  echo "docker run -p 8000:8000 <arguments> <docker-image-name> serve"
}

if [[ $1 == 'produce' ]];
then

  cd $MKPATH

  if ! grep -q 'dev_addr: 0.0.0.0:8000' mkdocs.yml;
  then
    echo 'dev_addr: 0.0.0.0:8000' >> mkdocs.yml
  fi

  mkdocs build --quiet
  cd ..
  if [[ -f ".tar.gz" ]];
  then
    rm .tar.gz
  fi
  tar -zcvf .tar.gz -C $MKPATH . &> /dev/null
  rm -rf $MKPATH/site
  cat .tar.gz

elif [[ $1 == 'serve' ]];
then

  cd $MKPATH
  mkdir mkserve
  tar -zxvf - -C mkserve
  cd mkserve
  mkdocs serve
else
  Manual
fi
