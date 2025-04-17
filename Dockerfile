# syntax=docker/dockerfile:1
FROM ubuntu:22.04 AS builder
RUN apt-get update && apt-get install -y g++ make build-essential
WORKDIR /app
COPY ./* ./
RUN make

FROM scratch
COPY --from=builder /app/predixy /
# COPY --from=builder /app/conf /conf
# ENTRYPOINT [ "/predixy" ]