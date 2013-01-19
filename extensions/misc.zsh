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

# say - append a newline to 'print'
function say() {
  print "$1\n"
}

function baseconvert() {
  if [[ -n "$1" ]] && [[ -n "$2" ]] && [[ -n "$3" ]]; then
      echo "ibase=${1}; obase=${2}; ${3}" | bc
  else
      echo "Usage: $0 <ibase> <obase> <number>"
      return 1
  fi
}

function bin2oct() { echo "ibase=2; obase=8; $@"   | bc }

function bin2dec() { echo "ibase=2; obase=10; $@"  | bc }

function bin2hex() { echo "ibase=2; obase=16; $@"  | bc }

function oct2bin() { echo "ibase=8; obase=2; $@"   | bc }

function oct2dec() { echo "ibase=8; obase=10; $@"  | bc }

function oct2hex() { echo "ibase=8; obase=16; $@"  | bc }

function dec2bin() { echo "ibase=10; obase=2; $@"  | bc }

function dec2oct() { echo "ibase=10; obase=8; $@"  | bc }

function dec2hex() { echo "ibase=10; obase=16; $@" | bc }

function hex2bin() { echo "ibase=16; obase=2; $@"  | bc }

function hex2oct() { echo "ibase=16; obase=8; $@"  | bc }

function hex2dec() { echo "ibase=16; obase=10; $@" | bc }


function hex2dec_f() { printf "%d\n" "0x$@" }

function dec2hex_f() { printf "%x\n" "$@"   }

### }}
