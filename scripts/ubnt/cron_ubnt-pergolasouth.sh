#
# UBNT Daily Video Timelapse - Pergola South
#

LOGPARENT="/mnt/attic/timelapse/ubnt/pergolasouth"

DATEYEAR=`date --date="$1 day ago" +%Y`
DATEMONTH=`date --date="$1 day ago" +%m`
DATEDAY=`date --date="$1 day ago" +%d`

FULLPATH="${LOGPARENT}/${DATEYEAR}/${DATEMONTH}/${DATEDAY}"

/root/bin/ffmpeg -r 30 -f image2 -pattern_type glob -i "${FULLPATH}/pergolasouth_*.jpg" \
-vcodec libx264 -crf 23 -pix_fmt yuv420p ${LOGPARENT}/pergolasouth_${DATEYEAR}${DATEMONTH}${DATEDAY}.mp4
