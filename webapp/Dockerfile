FROM ubuntu:xenial
ADD ./webapp /webapp
ADD ./static /webapp/static
ADD ./templates /webapp/templates

WORKDIR /webapp
RUN apt-get update && apt-get install python3 python3-pip python3-dev -y 
RUN pip3 install flask uwsgi
RUN pip3 install Flask-Mail
CMD ["uwsgi", "--ini", "config.ini"]
