#
# UBNT Daily Video Timelapse - Pergola North
#

LOGPARENT="/mnt/attic/timelapse/ubnt/pergolanorth"

DATEYEAR=`date --date="$1 day ago" +%Y`
DATEMONTH=`date --date="$1 day ago" +%m`
DATEDAY=`date --date="$1 day ago" +%d`

FULLPATH="${LOGPARENT}/${DATEYEAR}/${DATEMONTH}/${DATEDAY}"

/root/bin/ffmpeg -r 30 -f image2 -pattern_type glob -i "${FULLPATH}/pergolanorth_*.jpg" -vcodec libx264 \
-crf 23 -pix_fmt yuv420p ${LOGPARENT}/pergolanorth_${DATEYEAR}${DATEMONTH}${DATEDAY}.mp4
