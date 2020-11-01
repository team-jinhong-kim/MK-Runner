#!/bin/bash

Manual() {
  echo "run example"
  echo "create Mkdocs project: docker run <arguments> <docker-image-name> produce > <output path(.tar.gz)>"
  echo "cat .tar.gz | docker run -p 8000:8000 <arguments> <docker-image-name> serve"
}
# If command is produce
if [[ $1 == 'produce' ]];
then

  cd $MKPATH
  # Confure dev_addr ip and port to allow host connect mkdocs service
  if ! grep -q 'dev_addr: 0.0.0.0:8000' mkdocs.yml;
  then
    echo 'dev_addr: 0.0.0.0:8000' >> mkdocs.yml
  fi

  mkdocs build --quiet
  cd ..
  # If .tar.gz  file already exists, remove it
  if [[ -f ".tar.gz" ]];
  then
    rm .tar.gz
  fi

  # Zip the archived mkdocs directory
  tar -zcvf .tar.gz -C $MKPATH . &> /dev/null
  rm -rf $MKPATH/site
  # Write out .tar.gz file to stdout
  cat .tar.gz

# If command is serve, receive .tar.gz file via stdin.
# decompress, dearchive .tar.gz file then run mkdocs service
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
