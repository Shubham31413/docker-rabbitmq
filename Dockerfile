FROM rabbitmq:3-management

# Expose RabbitMQ default ports
EXPOSE 5672 15672

# Healthcheck to keep Render service active
HEALTHCHECK CMD rabbitmq-diagnostics -q check_running

# Default command
CMD ["rabbitmq-server"]
