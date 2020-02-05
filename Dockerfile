FROM elixir:1.9.0-alpine

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix local.hex --force
RUN mix local.rebar
RUN mix deps.get
RUN mix do compile