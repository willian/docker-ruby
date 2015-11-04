# The container includes:
#
# willian/ruby:2.2-node12-qt:
# * MRI Ruby 2.2.3
# * NodeJS 0.12
# * Bundler
# * Image Magick
# * QT
#

FROM azukiapp/ruby:2.2-node12
MAINTAINER Willian Fernandes <willian@willianfernandes.com.br>

# Set $PATH so that non-login shells will see the Ruby binaries
ENV PATH $PATH:/opt/rubies/ruby-$RUBY_VERSION/bin

# install depdencies
RUN apt-get update &&  \
    DEBIAN_FRONTEND=noninteractive apt-get -y upgrade &&  \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libqt4-dev \
    qt4-qmake

RUN apt-get autoremove -y
RUN apt-get clean

# Define working directory
WORKDIR /app

# Set bash as a default process
CMD ["bash"]
