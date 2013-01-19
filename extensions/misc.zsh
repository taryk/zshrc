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

### }}
