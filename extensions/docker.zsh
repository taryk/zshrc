# On MacOS X, docker won't know which docker machine to talk to if its
# essential env variables are not set.
# So set them each time a new shell starts.
# Also they can be updated with `docker_env_default` for a current shell
# when a docker machine restarts.

function docker_env_default() {
    eval $(docker-machine env default)
}

docker_env_default
