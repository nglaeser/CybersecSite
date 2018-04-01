FROM python
ADD ./webapp /webapp
ADD ./static /webapp/static
ADD ./templates /webapp/templates

RUN pip install flask uwsgi Flask-Mail

WORKDIR /webapp
CMD ["uwsgi", "--ini", "config.ini"]
