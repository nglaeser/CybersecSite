FROM ubuntu:xenial
ADD ./mailhandler /mailhandler

WORKDIR /mailhandler
RUN apt-get update && apt-get install python3 -y
CMD ["python3", "mailtest.py"]
