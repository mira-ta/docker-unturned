#!/usr/bin/env sh
if [ ! -r Dockerfile ]; then
    echo "No dockerfile has been found!" 1>&2
    exit 1
fi

if [ "${*}" == "" ]; then
    echo "Specify rocket version!" 1>&2
    exit 2
fi

# if here-string is not available though
if ! { echo "${*}" | grep -q -E '([0-9]+\.)+[0-9]+'; }; then
    echo "Rocket version is in invalid format!" 1>&2
    exit 3
fi

sed -E -i "/^ARG/ s/([0-9]+\.)+[0-9]+/${*}/" Dockerfile

echo "Changed ROCKET_VERSION default argument to ${*}" 1>&2
