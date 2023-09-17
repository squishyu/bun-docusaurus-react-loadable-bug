FROM squishyu/bun-alpine:1.0.2 as install-dependencies

WORKDIR /app

COPY . .

RUN bun install --frozen-lockfile

FROM install-dependencies as builder

RUN bun run build
