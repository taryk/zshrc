### {{ SCALA

SCALAPATH='/opt/scala/bin'
if [ -d $SCALAPATH ]; then
    export PATH="${SCALAPATH}:${PATH}"
fi

# SBT
SBTPATH='/opt/sbt/bin'
if [ -d $SBTPATH ] ; then
    export PATH="${PATH}:${SBTPATH}"
fi

### }}
