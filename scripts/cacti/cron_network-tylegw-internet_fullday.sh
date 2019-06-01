#
# Cacti Daily Video Timelapse - Network - tylegw - fullday
#

LOGPARENT="/mnt/attic/timelapse/cacti/network/tylegw/fullday"

DATEYEAR=`date --date="$1 day ago" +%Y`
DATEMONTH=`date --date="$1 day ago" +%m`
DATEDAY=`date --date="$1 day ago" +%d`

FULLPATH="${LOGPARENT}/${DATEYEAR}/${DATEMONTH}/${DATEDAY}"

ffmpeg -r 60 -f image2 -pattern_type glob -i "${FULLPATH}/network-tylegw-internetfullday_*.png" -vcodec libx264 -crf 23 -pix_fmt yuv420p ${LOGPARENT}/network-tylegw-internetfullday_${DATEYEAR}${DATEMONTH}${DATEDAY}.mp4
