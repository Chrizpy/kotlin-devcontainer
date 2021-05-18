# Kotlin Docker Development Container

This is a development container I put together that will let me play around with [Kotlin](https://kotlinlang.org/) without littering down my computer.

And since I use multiple different computers, it'll let me get up and running with Kotlin faster.

Big thanks to Avdi at [RubyTapas](www.rubytapas.com) who made really good videos on how to setup your own working environment with Docker.

My Dockerfile is essentially the same as the user [nishtahir](https://github.com/nishtahir/alpine-kotlin/blob/master/1.0.4/Dockerfile), I only added one line that will symlink `/usr/bin/bash` to `/usr/local/bin/bash`.

## Setup

There are two super small scripts, one for starting up the container and one for jumping into it.

```bash
$ ls ./bin
hop_in.sh
start_container.sh
```

**Note**: You may need to give execution access to the scripts. (chmod +x)

### start_container.sh

```bash
docker-compose up -d
```

### hop_in.sh

```bash
docker-compose exec kotlin-devcontainer bash -l
```

## Hello World

To see that everything is working as expected, I added a must have `"Hello World!"` project.

### Compile

```bash
kotlinc HelloWorld.kt -include-runtime -d HelloWorld.jar
```

### Run

```bash
kotlin HelloWorld.jar
```

## Some notes

* Compilation time is really slow for me, I wonder if it is due to the fact that I only ran this so far on my Mac, will try on Windows later where I think they have better performance with Docker.
  * ```bash
    real  3m27.948s
    user  0m13.446s
    sys	  0m14.094s
    ```

* The way this development container runs forever is a little dirty, `docker-compose` will run the command `tail -F anything` where tail will not stop executing even when end of a file. Since the file `anything` does not exist anyway, it will forever keep the container alive.
