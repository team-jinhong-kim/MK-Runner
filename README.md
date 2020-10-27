# Welcome to MK-runner !

Hello, MK-runner is encapsulated [MKdocs](https://www.mkdocs.org/)


# How to use?

MK-runner supports two commands <b>produce</b> and <b>serve</b>

## How to producing the website?
```
$ docker run <arguments> <the-docker-image-name> produce
```
please replace
\<arguments\> to -v \<mkdocs project path in host\>:\<mkdocs project path in container\> -e MKPATH=\<mkdocs project path in host\>
and \<the-docker-image-name\> to docker image name.

after running the command, please find ".tar.gz" file in the mounted path.
".tar.gz" file will contain index.html in it's root, and all the resources produced by MKdocs.

## How to Running the website?
```
$ docker run -p 8000:8000 <arguments> <the-docker-image-name> serve
```
please replace \<arguments\> to "-v mkdocs project path in host : mkdocs project path in container" and
 \<the-docker-image-name\> to docker image name.
 after runng the command you can check it's result by browse to http://localhost:8000 .
