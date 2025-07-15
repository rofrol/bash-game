```
docker build -t cli-bash-game .
docker run --rm -it -v "$PWD":/home/student cli-bash-game
```

interactive:

`docker run --rm -it -v "$PWD":/home/student --entrypoint /bin/bash cli-bash-game`
