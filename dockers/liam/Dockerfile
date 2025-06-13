ARG GO_VERSION=1.24.4
FROM golang:${GO_VERSION}-alpine AS liam-builder
RUN apk add --no-cache nodejs npm git bash
ARG TBLS_VERSION=1.85.4
RUN go install github.com/k1LoW/tbls@v${TBLS_VERSION}
WORKDIR /work
