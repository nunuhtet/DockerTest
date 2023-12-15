# Use an official Ruby runtime as a parent image
FROM ruby:3.2.1

# Set the working directory in the container
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Install Rails
RUN gem install rails -v 7.0.8

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile* ./

# Install Ruby dependencies
RUN bundle install

# Copy the main application
COPY . .

# Expose port 3000 to the outside world
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]