Dockerfile for [Ammonite](https://github.com/lihaoyi/Ammonite)

Based on alpine for minimal size

Docker Hub: [https://hub.docker.com/r/note/ammonite](https://hub.docker.com/r/note/ammonite)

## Usage

### Run a script with Ammonite

You can execute a script `hello.sc` with:

```
docker run --rm -it -v $HOME/.cache/coursier:/root/.cache/coursier -v $(pwd)/hello.sc:/root/hello.sc note/ammonite amm hello.sc
```

### Open Ammonite REPL

```
docker run --rm -it -v $HOME/.cache/coursier:/root/.cache/coursier note/ammonite
```
