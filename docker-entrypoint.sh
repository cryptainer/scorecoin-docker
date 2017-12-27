#!/bin/bash

# Apply scorecoin.conf configuration from environment variables
env | grep ^conf_ | sed -r 's/^conf_//g' > ${WALLET_CONF};

# If the container was restarted / the data directory is mounted from the host, there may be an old lock file
rm -f ${WALLET_DATA}/.lock

echo "Starting Scored."

if [ ${DEBUG} ]
then
    echo "Score.conf:"
    cat ${WALLET_CONF}
else
    echo "Set DEBUG=1 to dump configs here."
fi

exec scored -conf=${WALLET_CONF} -datadir=${WALLET_DATA}