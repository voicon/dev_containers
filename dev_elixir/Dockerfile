FROM alexblackie/dev_erlang:18

ENV PATH /usr/local/elixir/bin:$PATH

ARG ELIXIR_VERSION=1.3.4

RUN dnf install -y unzip postgresql && dnf clean all

RUN curl -Lo /tmp/elixir.zip https://github.com/elixir-lang/elixir/releases/download/v$ELIXIR_VERSION/Precompiled.zip && \
	mkdir /usr/local/elixir && \
	unzip -d /usr/local/elixir /tmp/elixir.zip && \
	rm /tmp/elixir.zip

USER developer
RUN mix local.hex --force && mix local.rebar --force
USER root
