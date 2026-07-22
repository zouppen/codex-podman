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
	file \
	curl \
	xxd \
	less \
	git

# Install Codex
RUN npm install -g @openai/codex

# Symlinks et cetera
COPY --chown=root:root template /

# Set working directory
WORKDIR /work

VOLUME /conf
VOLUME /work

# Default command (example usage of installed package)
CMD ["codex", "-s", "danger-full-access"]
