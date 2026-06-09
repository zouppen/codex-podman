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
container. You may need different utilities than I, so make a copy of
directory `my_dev` and create your own `Containerfile`

You may create your own Containerfile for your needs. I've put my
example in [my_dev](my_dev/Containerfile). To build it:

```
cd my_dev
podman build -t my_codex .
```

## Running

```
podman run -it --rm -v /YOUR_PATH/conf:/root/.codex:Z -v /YOUR_PATH/work:/work:Z my_codex
```
