# Pixelfed Docker Images

Forked from the [in-repo Dockerfiles](https://github.com/pixelfed/pixelfed/tree/dev/contrib/docker) primarily because I wanted nginx as the web daemon and something to publish to use in a Helm chart.

Tags are rebuilt daily so you should use the SHA hash if mutability concerns you.

Images at ghcr.io/mattlqx/docker-pixelfed

Available tags:
- dev-nginx
- v0.12.6-nginx

## Environment Variables

In addition to [the environment variables supported by PixelFed](https://docs.pixelfed.org/running-pixelfed/configuration.html), the following variables are supported:

| Variable | Description | Default |
| -------- | ----------- | ------- |
| APP_PORT | Port that nginx will listen on | - |
| APP_DOMAIN | Server name/domain for nginx configuration | - |
| ENABLE_HORIZON | Enable Laravel Horizon queue worker in the container. By default, it is expected to be run elsewhere. | false |

## Maintainer

Matt Kulka <matt@lqx.net>
