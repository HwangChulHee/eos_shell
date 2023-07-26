#! /bin/bash

cd ~/eos/${1}

rm ~/eos/${1}/blockchain/nodeos.log

~/eos/${1}/start.sh

clear

echo "log remove and start ${1}..."

exit 0
