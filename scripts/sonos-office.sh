#
# Cacti WGET Timelapse - Sonos - office
#

LOGPARENT="/mnt/attic/timelapse/cacti/sonos/office/2h-slide"

DATEYEAR=`date +%Y`
DATEMONTH=`date +%m`
DATEDAY=`date +%d`

FULLPATH="${LOGPARENT}/${DATEYEAR}/${DATEMONTH}/${DATEDAY}"

    if [ ! -d ${FULLPATH} ]
        then
        mkdir -p ${FULLPATH}
    fi

DATENOW=`date -d '1 minute ago' +%s`
DATETHEN=`date -d '121 minutes ago' +%s`

wget -q -O ${FULLPATH}/sonosoffice_${DATENOW}.png "http://pfweb01.pulpfree.net/cacti/graph_image.php?local_graph_id=1507&graph_start=${DATETHEN}&graph_end=${DATENOW}&graph_width=1803&graph_height=845"
