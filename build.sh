VERSION=1.11.2.4
docker build --build-arg VERSION=$VERSION -t geslot/rpi-openresty:$VERSION .
