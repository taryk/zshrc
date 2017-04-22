### {{
# PERL

# perlbrew
alias pbi='perlbrew install'
alias pbl='perlbrew list'
alias pbo='perlbrew off'
alias pbs='perlbrew switch'
alias pbu='perlbrew use'
alias pbu='perlbrew available'

export PERLBREW_ROOT=/opt/perl5
export PERLBREW_PATH="$PERLBREW_ROOT/bin:$HOME/perl5/perlbrew/bin"

# imports perlbrew function
if [ -f "$PERLBREW_ROOT/etc/bashrc" ]; then
    source "$PERLBREW_ROOT/etc/bashrc"
fi

# perldoc
alias pd='perldoc'

# use perl like awk/sed
alias ple='perl -wlne'

# latest stable perl version
latest-perl() {
  curl -s https://www.perl.org/get.html | perl -wlne 'if (/perl\-([\d\.]+)\.tar\.gz/) { print $1; exit;}'
}

# pgs - Perl Global Substitution
# find pattern          = 1st arg
# replace pattern       = 2nd arg
# filename              = 3rd arg
pgs() { # [find] [replace] [filename]
  perl -i.orig -pe 's/'"$1"'/'"$2"'/g' "$3"
}


# Perl grep, because 'grep -P' is terrible. Lets you work with pipes or files.
prep() { # [pattern] [filename unless STDOUT]
  perl -nle 'print if /'"$1"'/;' $2
}
### }}

# Migrate all currently installed CPAN modules to another perl.
# Takes one parameter - a perl version, in accordance with `perlbrew list`.
function reinstall-all-perl-modules-on-new-perl() {
    perlbrew list-modules | perlbrew exec --with $1 cpanm -n --sudo
}
