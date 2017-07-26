FROM ruby:2.4.1
ENV HOME=/usr/src/quantum
WORKDIR $HOME

# Install yarn
RUN apt-get update && \
    apt-get -y install apt-transport-https && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get -y install yarn ca-certificates

# Install NodeJS
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs

EXPOSE 3000
CMD ["./run.sh"]
