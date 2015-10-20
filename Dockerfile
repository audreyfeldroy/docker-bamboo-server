FROM java
MAINTAINER Audrey Roy Greenfeld (@audreyr)

# Environment
ENV BAMBOO_VERSION 5.9.7
ENV BAMBOO_HOME /usr/local/bamboo

# Expose web and agent ports
EXPOSE 8085
EXPOSE 54663

# Download and install Bamboo Server
RUN curl -SL https://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-$BAMBOO_VERSION.tar.gz -o bamboo.tar.gz
RUN tar xzvf bamboo.tar.gz -C $BAMBOO_HOME \
  && rm bamboo.tar.gz \
  && cd $BAMBOO_HOME \
  && bin/start-bamboo.sh