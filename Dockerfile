FROM rust:alpine AS build
ARG V8_FROM_SOURCE=1 
RUN apk add --no-cache build-base openssl-dev py3-pip python3 gn && pip install ninja && cargo install sccache && export RUSTC_WRAPPER=/usr/local/cargo/bin/sccache && cargo install deno --locked

FROM alpine
COPY --from=build /usr/local/cargo/bin/deno /usr/local/bin
