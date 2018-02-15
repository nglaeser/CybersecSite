FROM ruby:2.5
ADD . /WebApp
WORKDIR /WebApp
RUN gem install jekyll bundler
RUN bundle
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
