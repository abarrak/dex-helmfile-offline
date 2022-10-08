#!/bin/bash

##
# Set versions from:
# - https://github.com/dexidp/dex/pkgs/container/dex/41956097?tag=v2.34.0
# - https://github.com/dexidp/helm-charts/tree/master/charts/dex
#
IMAGE_VERSION=v2.34.0
CHART_VERSION=0.11.1

echo "= 1] Sync the images offline:"
echo "== Pulling the image .."
docker pull ghcr.io/dexidp/dex:${IMAGE_VERSION}

echo "== Taging the image .."
docker tag registry.local.lan/ghcr.io/dexidp/dex:${IMAGE_VERSION} ghcr.io/dexidp/dex:${IMAGE_VERSION}

echo "== Saving to the local folder ..."
docker save registry.local.lan/ghcr.io/dexidp/dex:${IMAGE_VERSION} -o ./output/images/dex_image_${IMAGE_VERSION}.tar


echo "= 2] Sync the charts offline:"
echo "== Pulling the helm charts .."
echo "== Saving to the local folder .."
helm repo add dex https://charts.dexidp.io
helm pull dex/dex --version ${CHART_VERSION} --destination ./output/charts/

echo "== Done!"
