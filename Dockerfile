# Start from the xcaddy builder image
FROM caddy:builder AS builder

WORKDIR /src

# Build Caddy with the custom module
RUN xcaddy build \
    --with github.com/dutchmendesign/posthog-proxy/caddy/posthogproxy \
    --output /usr/bin/caddy # Ensure the output path is clear

# Stage 2: Runner
FROM caddy:latest 
# Or a suitable base image like alpine/debian for production

# Copy the built Caddy binary from the builder stage
COPY --from=builder /usr/bin/caddy /usr/local/bin/caddy

# Set execute permissions for the Caddy binary
RUN chmod +x /usr/local/bin/caddy

# Add the setcap command here to remove capabilities
# This applies to the caddy binary in its final location (/usr/local/bin/caddy)
RUN setcap -r /usr/local/bin/caddy

# Copy Caddyfile and other necessary files
COPY Caddyfile /etc/caddy/Caddyfile
# ... any other files needed by your Caddy setup

# Expose ports (if applicable)
EXPOSE 80 443 
# Adjust based on your Caddyfile

# Define the command to run Caddy
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
