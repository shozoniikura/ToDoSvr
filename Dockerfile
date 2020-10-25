FROM ruby:2.7.1

ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs less vim

# yarnパッケージ管理ツールインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

ARG UID
ARG GID
ARG UNAME

ENV UID ${UID}
ENV GID ${GID}
ENV UNAME ${UNAME}

RUN groupadd -g ${GID} ${UNAME}
RUN useradd -u ${UID} -g ${UNAME} -m ${UNAME}

RUN mkdir /src
WORKDIR /src
RUN echo ${UID}, ${GID}, ${UNAME}
ADD ./src/Gemfile /src/Gemfile
ADD ./src/Gemfile.lock /src/Gemfile.lock
# ADD ./bundle /usr/local/bundle
RUN bundle install
ADD ./.bashrc /home/${UNAME}/