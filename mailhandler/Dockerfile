FROM ubuntu:xenial

RUN apt update && apt install exim4 -y

ADD ./mailhandler/mailname /etc
ADD ./mailhandler/update-exim4.conf.conf /etc/exim4
ADD ./mailhandler/passwd.client /etc/exim4
ADD ./mailhandler/email-addresses /etc
RUN update-exim4.conf
RUN echo '* usccyber@yandex.com Ffrs' >> /etc/exim4/conf.d/rewrite/30_docker

WORKDIR /mailhandler
ADD ./mailhandler/mail.py .
ADD ./mailhandler/WARNINGS .
ADD ./mailhandler/saved .

# run mailer as foreground daemon checking queue every half-hour
CMD ["exim4", "-bdf", "-q30m"]
