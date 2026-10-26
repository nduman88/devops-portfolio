FROM ubuntu:22.04
WORKDIR /app
COPY . .
RUN chmod +x health_check.sh info.sh
CMD ["bash", "./health_check.sh"]
