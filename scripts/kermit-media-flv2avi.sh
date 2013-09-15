#!/bin/sh

if [ -z "$1" ]; then
  echo "Usage: $0 {-divx|-xvid} list_of_flv_files"
  exit 1
fi

# video encoding bit rate
V_BITRATE=1000

while [ "$1" ]; do
  case "$1" in
    -divx)
      MENC_OPTS="-ovc lavc -lavcopts \
        vcodec=mpeg4:vbitrate=$V_BITRATE:mbd=2:v4mv:autoaspect"
      ;;
    -xvid)
      MENC_OPTS="-ovc xvid -xvidencopts bitrate=$V_BITRATE:autoaspect"
      ;;
    *)
      if file "$1" | grep -q "Macromedia Flash Video"; then
        mencoder "$1" $MENC_OPTS -vf pp=lb -oac mp3lame \
          -lameopts fast:preset=standard -o \
          "`basename $1 .flv`.avi"
      else
        echo "$1 is not Flash Video. Skipping"
      fi
      ;;
  esac
  shift
done
