export GOPATH="$HOME/Development/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOPATH/bin"

# If we are on linux, and Golang is installed in its default location
# /usr/local/go, add it to PATH.
if [[ "$OSTYPE" == "linux-gnu" && -d "/usr/local/go/bin" ]]; then
    export PATH="$PATH:/usr/local/go/bin"
fi
