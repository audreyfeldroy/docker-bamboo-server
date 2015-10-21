# Docker image for Bamboo Server

A containerized installation of Atlassian Bamboo setup with a goal of keeping the installation as default as possible, but with a few Docker related twists.

Patterned after https://github.com/cptactionhank/docker-atlassian-jira

## Quickstart

To quickly get started with running a Bamboo instance, first run the following command:
```bash
docker run --detach --publish 8085:8085 aroygreenfeld/bamboo-server:latest
```

Then use your browser to navigate to `http://[dockerhost]:8085` and finish the configuration.
