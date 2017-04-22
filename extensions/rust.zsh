### {{ Rust

source $HOME/.cargo/env

#
# Puts ~/.cargo/bin to PATH if exists
#
if [ -d ~/.cargo/bin ] ; then
    PATH=~/.cargo/bin:"${PATH}"
fi

### }}
