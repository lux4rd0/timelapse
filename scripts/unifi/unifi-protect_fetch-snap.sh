#
# Unifi Protect WGET Snap
#

CAMERA=$1

PARENTPATH="/mnt/attic/timelapse/unifi"

DATEYEAR=`date +%Y`
DATEMONTH=`date +%m`
DATEDAY=`date +%d`

IMAGEPATH="${PARENTPATH}/${CAMERA}/${DATEYEAR}/${DATEMONTH}/${DATEDAY}"

    if [ ! -d ${IMAGEPATH} ]
        then
        mkdir -p ${IMAGEPATH}
    fi

FULLDATE=`date +'%s'`

wget -q -O ${IMAGEPATH}/${CAMERA}_${FULLDATE}.jpg "http://cam-${CAMERA}.tylephony.com/snap.jpeg"
