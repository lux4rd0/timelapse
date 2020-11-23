#!/bin/sh
#
# Generate Sequence of Images from Grafana for Timelapse
# Finance Exporter
#

# Use "cat list.txt |parallel -j8" to pull images


rm /mnt/attic/timelapse/grafana/external/grafana-finance_exporter.txt

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

IMAGE_PARENT="/mnt/attic/timelapse/grafana/external/finance_exporter"

FULL_IMAGE_PATH="${IMAGE_PARENT}/${RANDOM_FOLDER}"

    if [ ! -d "${FULL_IMAGE_PATH}" ]
        then
        mkdir -p "${FULL_IMAGE_PATH}"
    fi

TIME_FROM=`expr ${START_TIME} - ${PANEL_TIME_FRAME}`
TIME_TO="${START_TIME}"

#echo "Image: ${FULL_IMAGE_PATH} TIME_TO:${TIME_TO} TIME_FROM: ${TIME_FROM}"

echo "${FULL_IMAGE_PATH}/${TIME_TO}.png|/usr/bin/docker container run -i --rm -v /mnt/attic:/mnt/attic -e TZ=America/Chicago docker01.tylephony.com:5000/lux4rd0/alpine-chrome:latest --headless --no-sandbox --enable-logging --force-device-scale-factor=2 --window-size=${WIDTH},${HEIGHT} --hide-scrollbars --run-all-compositor-stages-before-draw --virtual-time-budget=1000000 --screenshot=${FULL_IMAGE_PATH}/${TIME_TO}.png http://grafana.tylephony.com/d/V2izE92Gz/finance-exporter-prom\?orgId=1\&from=${TIME_FROM}000\&to=${TIME_TO}000\&var-constant_equity=EQUITY\&var-constant_index=INDEX\&var-Equity=All\&var-Index=All\&var-Smooth=1m\&theme=dark\&kiosk" >> /mnt/attic/timelapse/grafana/external/grafana-finance_exporter.txt


#echo "${FULL_IMAGE_PATH}/${TIME_TO}.png|/usr/bin/docker container run -i --rm -v /mnt/attic:/mnt/attic -e TZ=America/Chicago docker01.tylephony.com:5000/lux4rd0/alpine-chrome:latest --headless --no-sandbox --enable-logging --force-device-scale-factor=2 --window-size=${WIDTH},${HEIGHT} --hide-scrollbars --run-all-compositor-stages-before-draw --virtual-time-budget=1000000 --screenshot=${FULL_IMAGE_PATH}/${TIME_TO}.png http://grafana.tylephony.com/d/FWUbgr2Mz/finance-exporter\?orgId=1\&from=${TIME_FROM}000\&to=${TIME_TO}000\&var-constant_index=INDEX\&var-constant_equity=EQUITY\&var-Index=All\&var-Equity=All\&theme=dark\&kiosk" >> /mnt/attic/timelapse/grafana/external/grafana-finance_exporter.txt

START_TIME=`expr ${START_TIME} + ${INTERVAL}`

done

echo ""

tail -1 /mnt/attic/timelapse/grafana/external/grafana-finance_exporter.txt

echo ""
echo "/mnt/attic/scripts/timelapse/grafana/grafana-generate-images-from-list.sh /mnt/attic/timelapse/grafana/external/grafana-finance_exporter.txt"
echo ""
echo "Prores"
echo ""
echo "docker run -v $(pwd):$(pwd) -v /mnt/attic:/mnt/attic -w $(pwd) jrottenberg/ffmpeg:latest -stats -r 30 -f image2 -pattern_type glob -i \"${FULL_IMAGE_PATH}/*.png\" -c:v prores_ks -f mov -profile:v 4444 -vf scale=out_color_matrix=bt709 \"/mnt/attic/timelapse/grafana/finance_exporter-${RANDOM_FOLDER}-prores.mp4\""
echo ""
echo "x264"
echo "docker run -v $(pwd):$(pwd) -v /mnt/attic:/mnt/attic -w $(pwd) jrottenberg/ffmpeg:latest -stats -r 30 -f image2 -pattern_type glob -i \"${FULL_IMAGE_PATH}/*.png\" -c:v libx264 -preset veryslow -crf 18 -x264opts colormatrix=bt709 \"/mnt/attic/timelapse/grafana/finance_exporter-${RANDOM_FOLDER}-x264.mp4\""
