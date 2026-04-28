# Codex container

A containerfile for [Codex](https://chatgpt.com/codex/) based agent
programming.

I created this because I want to use Codex conveniently from the
command line, not messing with my development environment or host
system. I have a subdirectory where I can co-edit the files or if I
want to keep even more distance, I can ask it to commit independently
and let me do my human commits separately.

This is intended as a start point for your own coding agent
container. You may need different utilities than I do so modify
[Containerfile](Containerfile) and add the packages and tools you need
for your development.

## Building

When building the first time it may be wise to use `--no-cache` to
avoid some old images coming from the past. If you do your own
modifications, it's a good idea to drop it to speed up building.

```
podman build --no-cache -t codex .
```

## Running

```
podman run -it --rm -v /YOUR_PATH/conf:/root/.codex:Z -v /YOUR_PATH/work:/work:Z codex
```
