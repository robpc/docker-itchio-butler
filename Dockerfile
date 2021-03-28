FROM debian:stable-slim AS base

ARG VERSION=15.20.0

FROM base AS download

RUN apt-get update && apt-get install unzip wget -y

# Install Butler
RUN wget -O butler-cli.zip https://broth.itch.ovh/butler/linux-amd64/${VERSION}/archive

RUN mkdir /butler
RUN unzip butler-cli.zip -d /butler
RUN chmod +x /butler/butler

FROM base
RUN apt-get update && apt-get install ca-certificates -y && rm -rf /var/lib/apt/lists/*

COPY --from=download /butler /butler

ENTRYPOINT ["/butler/butler"]
CMD ["--help"]