FROM rust:alpine AS build
RUN apk add --no-cache ccache build-base && cargo install deno --locked

FROM alpine
COPY --from=build /usr/local/cargo/bin/deno /usr/local/bin
