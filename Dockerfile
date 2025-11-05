FROM debian:11

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash curl wget git netcat-openbsd python3 \
    && rm -rf /var/lib/apt/lists/*

# Меняем порт на нестандартный
EXPOSE 8080

# Используем Python вместо netcat для health check
CMD ["/bin/bash", "-c", "python3 -m http.server 8080 & tail -f /dev/null"]
