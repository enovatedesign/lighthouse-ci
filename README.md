# Lighthouse CI

Lighthouse CI is a Docker image used to run Google Lighthouse Audits within a CI environment :rocket:

:warning: There are multiple ways of running Lighthouse within CI. We are using the [LHCI](https://github.com/GoogleChrome/lighthouse-ci)

## Contributing

All commits / pull requests should be made to the develop branch. This will build automatically within DockerHub to the develop Docker tag.

Once tested, develop should be merged into master. A release then needs to be made off of master with the version number incrementing from the previous (e.g. `v1.2.0` :arrow_right: `v1.2.1`). DockerHub will build this tag and the latest branch will be re-built to match the master branch.