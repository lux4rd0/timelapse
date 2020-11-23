#!/bin/sh
#
# Generate Sequence of Images from Grafana for Timelapse
# Synthetics Dashboard
#

rm /mnt/attic/timelapse/grafana/external/grafana-synthetics.txt

START_TIME=$1
END_TIME=$2
INTERVAL=$3
PANEL_TIME_FRAME=$4

WIDTH=$5
HEIGHT=$6


## Random Folder

RANDOM_FOLDER=$(( $RANDOM ))

while [ "${END_TIME}" -gt "${START_TIME}" ]
do

#echo "${START_TIME}"

## Fetch Image


IMAGE_PARENT="/mnt/attic/timelapse/grafana/external/synthetics"

FULL_IMAGE_PATH="${IMAGE_PARENT}/${RANDOM_FOLDER}"

    if [ ! -d "${FULL_IMAGE_PATH}" ]
        then
        mkdir -p "${FULL_IMAGE_PATH}"
    fi

TIME_FROM=`expr ${START_TIME} - ${PANEL_TIME_FRAME}`
TIME_TO="${START_TIME}"

#echo "Image: ${FULL_IMAGE_PATH} TIME_TO:${TIME_TO} TIME_FROM: ${TIME_FROM}"

echo "${FULL_IMAGE_PATH}/${TIME_TO}.png|/usr/bin/docker container run -i --rm -v /mnt/attic:/mnt/attic -e TZ=America/Chicago docker01.tylephony.com:5000/lux4rd0/alpine-chrome:latest --headless --no-sandbox --enable-logging --force-device-scale-factor=2 --window-size=${WIDTH},${HEIGHT} --hide-scrollbars --run-all-compositor-stages-before-draw --virtual-time-budget=1000000 --screenshot=${FULL_IMAGE_PATH}/${TIME_TO}.png http://grafana.tylephony.com/d/fU-WBSqWz/synthetic-monitoring-summary\?orgId=1\&from=${TIME_FROM}000\&to=${TIME_TO}000\&theme=dark\&kiosk" >> /mnt/attic/timelapse/grafana/external/grafana-synthetics.txt

START_TIME=`expr ${START_TIME} + ${INTERVAL}`

done

tail -1 /mnt/attic/timelapse/grafana/external/grafana-synthetics.txt

echo ""

echo "/mnt/attic/scripts/timelapse/grafana/grafana-generate-images-from-list.sh /mnt/attic/timelapse/grafana/external/grafana-synthetics.txt"
