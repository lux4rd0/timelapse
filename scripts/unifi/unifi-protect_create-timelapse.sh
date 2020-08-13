#
# Unifi Protect Daily Video Timelapse
#

## Unifi Protect Timelapse

#0 2 * * * /mnt/attic/scripts/timelapse/unifi/unifi-protect_create-timelapse.sh 1 frontdoor >/dev/null 2>&1
#15 2 * * * /mnt/attic/scripts/timelapse/unifi/unifi-protect_create-timelapse.sh 1 pergolanorth >/dev/null 2>&1
#30 2 * * * /mnt/attic/scripts/timelapse/unifi/unifi-protect_create-timelapse.sh 1 pergolasouth >/dev/null 2>&1

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
