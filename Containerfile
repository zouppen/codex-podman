# Use a stable Debian as the base image
FROM debian:trixie

# Non-interactive apt
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install some packages
RUN apt-get update

# Needed by Codex
RUN apt-get install -y --no-install-recommends \
	nodejs \
	npm \
	ripgrep \
	bubblewrap \
	git

# Install Codex
RUN npm install -g @openai/codex

# My own set of tools
RUN apt-get install -y --no-install-recommends \
	gcc \
	cmake

# Clean-up
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# Symlinks et cetera
COPY --chown=root:root template /

# Set working directory
WORKDIR /work

VOLUME /conf
VOLUME /work

# Default command (example usage of installed package)
CMD ["codex", "-a", "on-request"]
