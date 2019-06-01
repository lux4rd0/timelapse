#
# Cacti WGET Timelapse - Network - tylegw - internet
#

LOGPARENT="/mnt/attic/timelapse/cacti/network/tylegw/4h-slide"

DATEYEAR=`date +%Y`
DATEMONTH=`date +%m`
DATEDAY=`date +%d`

FULLPATH="${LOGPARENT}/${DATEYEAR}/${DATEMONTH}/${DATEDAY}"

    if [ ! -d ${FULLPATH} ]
        then
        mkdir -p ${FULLPATH}
    fi

DATENOW=`date -d '1 minute ago' +%s`
DATETHEN=`date -d '241 minutes ago' +%s`

wget -q -O ${FULLPATH}/network-tylegw-internet_${DATENOW}.png "http://pfweb01.pulpfree.net/cacti/graph_image.php?local_graph_id=1001&rra_id=5&graph_start=${DATETHEN}&graph_end=${DATENOW}&graph_width=1803&graph_height=899"                                                                                                                                   
