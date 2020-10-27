FROM python:3.7
MAINTAINER Jake Kim

COPY ./requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt
EXPOSE 8000

RUN mkdir /app
WORKDIR /app
COPY mkdockerize.sh ./

RUN chmod +x ./mkdockerize.sh
ENTRYPOINT ["./mkdockerize.sh"]
