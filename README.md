## Run a script

```
docker run --rm -it -v $HOME/.cache/coursier:/root/.cache/coursier -v $(pwd)/hello.sc:/root/hello.sc myamm:something amm hello.sc
```

## Open a REPL

```
docker run --rm -it -v $HOME/.cache/coursier:/root/.cache/coursier  myamm:something
```
