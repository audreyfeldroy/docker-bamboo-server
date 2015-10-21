# Docker image for Bamboo Server

A containerized installation of Atlassian Bamboo setup with a goal of keeping the installation as default as possible, but with a few Docker related twists.

Patterned after https://github.com/cptactionhank/docker-atlassian-jira

## Quickstart

To quickly get started with running a Bamboo instance, first run the following command:
```bash
docker run --detach --publish 8085:8085 aroygreenfeld/bamboo-server:latest
```

Then use your browser to navigate to `http://[dockerhost]:8085` and finish the configuration.

# Persist BAMBOO_HOME on the docker host

By default the Bamboo config and database is stored in the container in /home/bamboo. You may map a directory on the host to this directory to store the Bamboo config and database outside of the container.

This is useful if you want to start containers using different versions of the image but with the same Bamboo database and license or if you want to backup this directory on the host. It also allows you to upgrade your Bamboo server without losing your data:

``` bash
run -v /data/bamboo-server:/home/bamboo --detach --publish 8085:8085 aroygreenfeld/bamboo-server:latest
```

