#! /bin/bash

clear

echo -e "\n  컨트랙트 코드 재 빌드  \n"

cd ~/eosio.contracts

cd build

make -j8


exit 0
