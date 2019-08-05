#
# UBNT WGET Timelapse - Pergola North
#

LOGPARENT="/mnt/attic/timelapse/ubnt/pergolanorth"

DATEYEAR=`date +%Y`
DATEMONTH=`date +%m`
DATEDAY=`date +%d`

FULLPATH="${LOGPARENT}/${DATEYEAR}/${DATEMONTH}/${DATEDAY}"

    if [ ! -d ${FULLPATH} ]
        then
        mkdir -p ${FULLPATH}
    fi

FULLDATE=`date +'%s'`

wget -q -O ${FULLPATH}/pergolanorth_${FULLDATE}.jpg "http://cam-pergolanorth.pulpfree.net/snap.jpeg"
