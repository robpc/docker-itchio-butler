# docker-itchio-butler

Docker builds for itch.io's [butler cli](https://itch.io/docs/butler/) used to upload to itch.io

The entrypoint calls the bulter cli (`/butler/butler`) so override the `command` with any arguments (default is `--help`).

### Usage Example (docker-compose)

```yaml
version: '2'
services:
  upload:
    image: robpc/itchio-butler:latest
    volumes:
      - ./:/project
    env_file: secrets.env # contains BUTLER_API_KEY=
    command: push /project/bin/html user/project-name:html # or other channel name
```
