FROM squishyu/bun-alpine:latest as install-dependencies

WORKDIR /app

COPY . .

RUN bun install --frozen-lockfile

FROM install-dependencies as builder

RUN bun run build
