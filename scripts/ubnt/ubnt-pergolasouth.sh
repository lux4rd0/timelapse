#
# UBNT WGET Timelapse - Pergola South
#

LOGPARENT="/mnt/attic/timelapse/ubnt/pergolasouth"

DATEYEAR=`date +%Y`
DATEMONTH=`date +%m`
DATEDAY=`date +%d`

FULLPATH="${LOGPARENT}/${DATEYEAR}/${DATEMONTH}/${DATEDAY}"

    if [ ! -d ${FULLPATH} ]
        then
        mkdir -p ${FULLPATH}
    fi

FULLDATE=`date +'%s'`

wget -q -O ${FULLPATH}/pergolasouth_${FULLDATE}.jpg "http://cam-pergolasouth.pulpfree.net/snap.jpeg"
