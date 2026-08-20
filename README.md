# Codex container

A containerfile for [Codex](https://chatgpt.com/codex/) based agent
programming.

I created this because I want to use Codex conveniently from the
command line, not messing with my development environment or host
system. I have a subdirectory where I can co-edit the files or if I
want to keep even more distance, I can ask it to commit independently
and let me do my human commits separately.

## Building

When building the first time it may be wise to use `--no-cache` to
avoid some old images coming from the past.

```
podman build --no-cache -t codex .
```

## Your own work environment

This is intended as a start point for your own coding agent
container. You may need different utilities than I, so feel free to
copy an example from directory `my_dev` and create your own
containerfile there.

You may create your own Containerfile for your needs. One of the examples is the PHP dev container in
[my_dev](my_dev/Containerfile-php). To build it:

```
podman build -t cdoex-php -f my_dev/Containerfile-php
```

## First time run

In the following snippets, we use host path `~/.config/codex-podman` for storing Codex login information etc. 

```
mkdir -p ~/.config/codex-podman/codex
podman run -it --rm -v ~/.config/codex-podman/codex:/conf:Z my_codex codex login --device-auth
```

Follow the instructions for logging in.

## Running

To run and share your current working directory with the Codex
container you may use this script. Don't fear
`--dangerously-bypass-approvals-and-sandbox` too much since it's in
the container, anyway.

```
#!/bin/sh -eu
exec podman run -it --rm -v ~/.config/codex-podman:/conf:Z -v "$PWD:/work:Z" codex-php codex --dangerously-bypass-approvals-and-sandbox "$@"
```

When continuing previous work in Codex, remember to load you context
with `/resume` or append `resume YOUR_UUID` to the script above.
