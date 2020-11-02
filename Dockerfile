FROM ruby:2.7.2

RUN apt-get update -qq && apt-get install -y build-essential postgresql-client libpq-dev

ENV APP_HOME /ecommerce-api
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD . $APP_HOME

RUN bundle install
ENTRYPOINT ["sh", "./entrypoint.sh"]
EXPOSE 3001

CMD ["rails", "server", "-b", "0.0.0.0"]
