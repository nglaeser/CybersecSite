FROM nginx
ADD ./static /webapp/static
COPY ./nginx/cybersec /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/cybersec /etc/nginx/sites-enabled
COPY ./nginx/cybersec /etc/nginx/conf.d/default.conf
CMD ["nginx","-g","daemon off;"]
