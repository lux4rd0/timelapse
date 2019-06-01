#
# Cacti Daily Video Timelapse - Sonos - office
#

LOGPARENT="/mnt/attic/timelapse/cacti/sonos/office/2h-slide"

DATEYEAR=`date --date="$1 day ago" +%Y`
DATEMONTH=`date --date="$1 day ago" +%m`
DATEDAY=`date --date="$1 day ago" +%d`

FULLPATH="${LOGPARENT}/${DATEYEAR}/${DATEMONTH}/${DATEDAY}"

ffmpeg -r 30 -f image2 -pattern_type glob -i "${FULLPATH}/sonosoffice_*.png" -vcodec libx264 -crf 23 -pix_fmt yuv420p ${LOGPARENT}/sonosoffice_${DATEYEAR}${DATEMONTH}${DATEDAY}.mp4
