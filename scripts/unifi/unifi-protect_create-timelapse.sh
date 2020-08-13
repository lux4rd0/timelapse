#
# Unifi Protect Daily Video Timelapse
#

DAYS=$1
CAMERA=$2

PARENTPATH="/mnt/attic/timelapse/unifi"

DATEYEAR=`date --date="$1 day ago" +%Y`
DATEMONTH=`date --date="$1 day ago" +%m`
DATEDAY=`date --date="$1 day ago" +%d`

IMAGEPATH="${PARENTPATH}/${CAMERA}/${DATEYEAR}/${DATEMONTH}/${DATEDAY}"
VIDEOPATH="${PARENTPATH}/video/${DATEYEAR}/${DATEMONTH}/${CAMERA}"

    if [ ! -d ${VIDEOPATH} ]
        then
        mkdir -p ${VIDEOPATH}
    fi

docker run -v $(pwd):$(pwd) -v /mnt/attic:/mnt/attic -w $(pwd)\
        jrottenberg/ffmpeg:latest -stats -r 30 -f image2 -pattern_type glob \
        -i "${IMAGEPATH}/${CAMERA}_*.jpg" \
        -c:v libx265 -preset medium -crf 25 -pix_fmt yuv420p -tag:v hvc1 \
       "${VIDEOPATH}/${CAMERA}_${DATEYEAR}${DATEMONTH}${DATEDAY}.mp4"
