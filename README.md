# Welcome to MK-runner !

Hello, MK-runner is encapsulated [MKdocs](https://www.mkdocs.org/)


# How to use?

MK-runner supports two commands <b>produce</b> and <b>serve</b>

## How to producing the website?
```
$ docker run <arguments> <the-docker-image-name> produce > <output-file-path>
```
please replace
\<arguments\> to -v \<mkdocs project path in host\>:\<mkdocs project path in container\> -e MKPATH=\<mkdocs project path in container\>
, \<the-docker-image-name\> to docker image name and \<output-file-path\> to the path where output file(.tar.gz) will be stored

after running the command, you can find output file in the configured path.
".tar.gz" file will contain index.html in it's root, and all the resources produced by MKdocs.

## How to Running the website?
```
$ cat <.tar.gz file path> | docker run -p 8000:8000 <arguments> <the-docker-image-name> serve
```
please replace
\<.tar.gz file path\> to .tar.gz file path, <.tar.gz file path>\<arguments\> to -v \<mkdocs project path in host\>:\<mkdocs project path in container\> -e MKPATH=\<mkdocs project path in container\>, and \<the-docker-image-name\> to docker image name.
after runng the command you can check it's result by browse to http://localhost:8000 .

## CI pipeline
This project's CI pipeline is implemented with Jenkins, so please check Jenkinsfile for further information.
You can find successful CI log from Jenkins.log

## Jenkins Configuration
1. Please install Docker plugin for Jenkins
2. Please give Docker commend permission to Jenkins
