### {{
# Misc

function mcd() { 
  mkdir $1; cd $1 
}

function fix_mp3() { 
  find -iname '*.mp3' -print0 | xargs -0 mid3iconv -eCP1251 --remove-v1 
}

function mpg2flv() { 
  ffmpeg -i $1 -ar 22050 -ab 32 -f flv -s 320x240 `echo $1 | awk -F . '{print $1}'`.flv 
}

function svn_ignore() {
  svn propedit svn:ignore .
}

function git_grep_rep() {
  git grep $1 -- $(git rev-parse --show-toplevel)
}

# newday() { mcd `date +%F` }
# c() { awk "{ print \$$1 }" }
# svnid() { svn propset svn:keywords "Author Date Id Revision" $1 }

function baseconvert() {
  if [[ -n "$1" ]] && [[ -n "$2" ]]; then
      for number in ${*:3}; do
          obase=$(echo "obase=${1}; ${2}" | bc)
          echo "ibase=${1}; obase=${obase}; ${number}" | bc
      done
  else
      echo "Usage: $0 <ibase> <obase> NUM-1 .. NUM-N"
      return 1
  fi
}

# binary predicate
function bin_p() {
  if [[ "${1/[^0-1]}" == "${1}" ]]; then
      return 0
  else
      echo "\"$@\" is not a bin number - just use bin digits [0-1]"
      return 1
  fi
}

# octal predicate
function oct_p() {
  if [[ "${1/[^0-7]}" == "${1}" ]]; then
      return 0
  else
     echo "\"$@\" is not an oct number - just use oct digits [0-7]"
     return 1
  fi
}

# decimal predicate
function dec_p() {
  if [[ "${1/[^0-9]}" == "${1}" ]]; then
      return 0
  else
      echo "\"$@\" is not a dec number - just use oct digits [0-9]"
      return 1
  fi
}

# hex predicate
function hex_p() {
  if [[ "${1/[^0-9A-Fa-f]}" == "${1}" ]]; then
      return 0
  else
      echo "\"$@\" is not a hex number - just use hex digits [0-F]"
      return 1
  fi
}

# NOTE: As soon as `ibase=x` is interpreted, numbers are read in base x.
# So `obase` should be in base specified in `ibase` value

function bin2oct() { bin_p $@ && echo "ibase=2; obase=1000; $@"  | bc }

function bin2dec() { bin_p $@ && echo "ibase=2; obase=1010; $@"  | bc }

function bin2hex() { bin_p $@ && echo "ibase=2; obase=10000; $@" | bc }

function oct2bin() { oct_p $@ && echo "ibase=8; obase=2; $@"     | bc }

function oct2dec() { oct_p $@ && echo "ibase=8; obase=12; $@"    | bc }

function oct2hex() { oct_p $@ && echo "ibase=8; obase=20; $@"    | bc }

function dec2bin() { dec_p $@ && echo "ibase=10; obase=2; $@"    | bc }

function dec2oct() { dec_p $@ && echo "ibase=10; obase=8; $@"    | bc }

function dec2hex() { dec_p $@ && echo "ibase=10; obase=16; $@"   | bc }

function hex2bin() { hex_p $@ && echo "ibase=16; obase=2; $@"    | bc }

function hex2oct() { hex_p $@ && echo "ibase=16; obase=8; $@"    | bc }

function hex2dec() { hex_p $@ && echo "ibase=16; obase=A; $@"    | bc }


function hex2dec_f() { printf "%d\n" "0x$@" }

function dec2hex_f() { printf "%x\n" "$@"   }

extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xvjf $1   ;;
      *.tar.gz)  tar xvzf $1   ;;
      *.bz2)     bunzip2 $1    ;;
      *.rar)     unrar x $1    ;;
      *.gz)      gunzip $1     ;;
      *.tar)     tar xvf $1    ;;
      *.tbz2)    tar xvjf $1   ;;
      *.tgz)     tar xvzf $1   ;;
      *.zip)     unzip $1      ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1       ;;
      *)         echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### }}
