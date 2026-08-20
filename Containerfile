# Use a stable Debian as the base image
FROM debian:trixie

# Non-interactive apt
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install some packages
RUN apt-get update

# Needed by Codex and useful generic Unix tools for everyday app develoment
RUN apt-get install -y --no-install-recommends \
	nodejs \
	npm \
	ripgrep \
	file \
	curl \
	xxd \
	less \
	git \
	ncat \
	jq \
	postgresql-client \
	sqlite3

# Install Codex
RUN npm install -g @openai/codex

# Symlinks et cetera
COPY --chown=root:root template /

# Set working directory
WORKDIR /work

VOLUME /conf
VOLUME /work

# Default command (example usage of installed package)
CMD ["codex", "--dangerously-bypass-approvals-and-sandbox"]
