#
# Cacti Daily Video Timelapse - Network - tylegw - 4h Slide
#

LOGPARENT="/mnt/attic/timelapse/cacti/network/tylegw/4h-slide"

DATEYEAR=`date --date="$1 day ago" +%Y`
DATEMONTH=`date --date="$1 day ago" +%m`
DATEDAY=`date --date="$1 day ago" +%d`

FULLPATH="${LOGPARENT}/${DATEYEAR}/${DATEMONTH}/${DATEDAY}"

ffmpeg -r 30 -f image2 -pattern_type glob -i "${FULLPATH}/network-tylegw-internet_*.png" -vcodec libx264 -crf 23 -pix_fmt yuv420p ${LOGPARENT}/network-tylegw-internet_${DATEYEAR}${DATEMONTH}${DATEDAY}.mp4
