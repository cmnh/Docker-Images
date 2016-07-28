FROM node:4-onbuild 
MAINTAINER Joel Marchewka "marchewkaj@carnegiemnh.org" version 1.2

ENV HTTPD_USER www-data

# Update
RUN apt-get update -qq && apt-get install -y ruby ruby-dev

#install SASS, Bower, Gulp and Gulp addons
RUN \
  npm install -g gulp && \
  npm install -g bower

RUN cd /tmp && npm install jshint gulp-jshint gulp-sass gulp-concat gulp-uglify gulp-rename --save-dev

COPY ./local_run.sh /
RUN chmod 755 /local_run.sh

ENTRYPOINT ["/local_run.sh"]
