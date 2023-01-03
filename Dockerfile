FROM ruby:3.1.2

# Install dependencies
RUN apt-get update -y && apt-get install -y nodejs libpq-dev poppler-utils poppler-data wget unzip

# Read gem file and isntall
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# Script that will be executed every time the container starts
# This script will ensure no other rails will be running by removing the pids
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
