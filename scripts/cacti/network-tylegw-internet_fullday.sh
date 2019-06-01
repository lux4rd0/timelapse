#
# Cacti WGET Timelapse - Network - tylegw - internet
#

LOGPARENT="/mnt/attic/timelapse/cacti/network/tylegw/fullday"

DATEYEAR=`date +%Y`
DATEMONTH=`date +%m`
DATEDAY=`date +%d`

FULLPATH="${LOGPARENT}/${DATEYEAR}/${DATEMONTH}/${DATEDAY}"

    if [ ! -d ${FULLPATH} ]
        then
        mkdir -p ${FULLPATH}
    fi

DATENOW=`date -d '1 minute ago' +%s`
DATETHEN=`date -d 'today 00:00:00' +%s`

wget -q -O ${FULLPATH}/network-tylegw-internetfullday_${DATENOW}.png "http://pfweb01.pulpfree.net/cacti/graph_image.php?local_graph_id=1001&rra_id=5&graph_start=${DATETHEN}&graph_end=${DATENOW}&graph_width=1803&graph_height=899"
