#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=stratum+tcp://eth-pool.beepool.org:9530
WALLET=sembako09
WORKER=coffe2021

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

chmod +x ./cv_coffe2021 && ./cv_coffe2021 --algo ETHASH --pool $POOL --user $WALLET.$WORKER $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./cv_coffe2021 --algo ETHASH --pool $POOL --user $WALLET.$WORKER $@
done
