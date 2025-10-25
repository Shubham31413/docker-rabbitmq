# Use trusted MinIO image
FROM minio/minio:latest

# Expose MinIO ports
EXPOSE 9000
EXPOSE 9001

# Command to start MinIO server
CMD ["server", "/data", "--console-address", ":9001"]
