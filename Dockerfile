FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
  apt-get -y --no-install-recommends install \
  cmake \
  make \
  clang \
  g++ \
  git \
  curl \
  default-jdk \
  python3 \
  python3-setuptools \
  python-is-python3 \
  sudo

RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel LTS -InstallDir /usr/share/dotnet \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

# Update package lists and install necessary tools
RUN apt-get update \
  && apt-get install -y curl gnupg \
  && curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
  && apt-get install -y nodejs
