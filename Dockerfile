FROM java
MAINTAINER Audrey Roy Greenfeld (@audreyr)

# Define bamboo version and install dir
ENV BAMBOO_VERSION 5.9.7
ENV BAMBOO_HOME /home/bamboo/
ENV BAMBOO_INSTALLATION /opt/atlassian/bamboo

# Expose web and agent ports
EXPOSE 8085
EXPOSE 54663

# Copy bamboo init script
COPY bamboo.sh /etc/init.d/bamboo

# Make the init script executable
RUN chmod \+x /etc/init.d/bamboo

# Place symlinks in the run-level directories to start and stop this script automatically
RUN update-rc.d bamboo defaults

# Create a bamboo user account which will be used to run Bamboo
RUN useradd --create-home -c "Bamboo role account" bamboo

# Have bamboo user own the dir where Bamboo is installed
RUN mkdir -p $BAMBOO_INSTALLATION
RUN chown bamboo: $BAMBOO_INSTALLATION

# Log in as the bamboo user to install Bamboo
RUN su - bamboo

# Download and install Bamboo Server
# TODO: Combine these commands to reduce image size. They're separate for debugging purposes only.
RUN curl -SL https://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-$BAMBOO_VERSION.tar.gz -o /tmp/atlassian-bamboo-$BAMBOO_VERSION.tar.gz
RUN cd $BAMBOO_INSTALLATION \
  && tar zxvf /tmp/atlassian-bamboo-$BAMBOO_VERSION.tar.gz \
  && rm /tmp/atlassian-bamboo-$BAMBOO_VERSION.tar.gz \
  && ln -s atlassian-bamboo-$BAMBOO_VERSION/ current
