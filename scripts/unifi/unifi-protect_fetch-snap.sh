#!/bin/bash

#
# Unifi Protect WGET Snap
#

# crontab UBNT Timelapse

#*/1 * * * * /mnt/attic/scripts/timelapse/unifi/unifi-protect_fetch-snap.sh frontdoor >/dev/null 2>&1
#*/1 * * * * /mnt/attic/scripts/timelapse/unifi/unifi-protect_fetch-snap.sh pergolanorth >/dev/null 2>&1
#*/1 * * * * /mnt/attic/scripts/timelapse/unifi/unifi-protect_fetch-snap.sh pergolasouth >/dev/null 2>&1

CAMERA=$1

PARENTPATH="/mnt/attic/timelapse/unifi"

DATEYEAR=$(date +%Y)
DATEMONTH=$(date +%m)
DATEDAY=$(date +%d)

IMAGEPATH="${PARENTPATH}/${CAMERA}/${DATEYEAR}/${DATEMONTH}/${DATEDAY}"

    if [ ! -d "${IMAGEPATH}" ]
        then
        mkdir -p "${IMAGEPATH}"
    fi

FULLDATE=$(date +'%s')

wget -q -O "${IMAGEPATH}"/"${CAMERA}"_"${FULLDATE}".jpg "http://cam-${CAMERA}.tylephony.com/snap.jpeg"
