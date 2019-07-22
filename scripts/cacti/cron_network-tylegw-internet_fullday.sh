#
# Cacti Daily Video Timelapse - Network - tylegw - fullday
#

LOGPARENT="/mnt/attic/timelapse/cacti/network/tylegw/fullday"

DATEYEAR=`date --date="$1 day ago" +%Y`
DATEMONTH=`date --date="$1 day ago" +%m`
DATEDAY=`date --date="$1 day ago" +%d`

FULLPATH="${LOGPARENT}/${DATEYEAR}/${DATEMONTH}/${DATEDAY}"

# Delete first minute's images first since they contain an error

START=`/usr/bin/date -d "-$1 day 00:00:00"`
END=`/usr/bin/date -d "-$1 day 00:01:00"`

/usr/bin/find ${FULLPATH} -maxdepth 1 -type f -name "*.png" -newermt "${START}" -not -newermt "${END}" -delete

/root/bin/ffmpeg -r 120 -f image2 -pattern_type glob -i "${FULLPATH}/network-tylegw-internetfullday_*.png" \
  -vcodec libx264 -crf 23 -pix_fmt yuv420p -r 60 \
  ${LOGPARENT}/network-tylegw-internetfullday_${DATEYEAR}${DATEMONTH}${DATEDAY}.mp4
