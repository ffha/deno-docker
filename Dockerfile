FROM rust:alpine AS build
ARG V8_FROM_SOURCE=1 
RUN apk add --no-cache libc-dev binutils fortify-headers make clang15 patch openssl-dev py3-pip python3 gn && pip install ninja && cargo install sccache && export RUSTC_WRAPPER=/usr/local/cargo/bin/sccache && export CLANG_BASE_PATH=/usr && cargo install deno --locked

FROM alpine
COPY --from=build /usr/local/cargo/bin/deno /usr/local/bin
