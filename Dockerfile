FROM rust:alpine AS build
ARG V8_FROM_SOURCE=1 
RUN apk add --no-cache build-base && cargo install deno --locked

FROM alpine
COPY --from=build /usr/local/cargo/bin/deno /usr/local/bin
