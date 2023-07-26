#! /bin/bash

genesis_dir=/root/eos/genesis
system_pk="EOS5ZPug7hgru7PoMzTTimBYCLwCdvmvJPsdSm2ZdybChSoTDogF6"


clear

#cleos unlock
echo -e "\n  cleos unlock..."
cleos wallet unlock --password "PW5JeQ5dL6Pmh5aJCtRAJJP5LAQ1mHTPQ14rRfcs5BHAkUAMWMVad"

sleep .5

echo -e "\n 1. genesis 블록 시작."
cd "$genesis_dir"
"./genesis_start.sh"

sleep 5

echo -e "\n 2. 시스템 계정 생성."

cleos create account eosio eosio.bpay $system_pk 

cleos create account eosio eosio.msig $system_pk 

cleos create account eosio eosio.names $system_pk 

cleos create account eosio eosio.ram $system_pk 

cleos create account eosio eosio.ramfee $system_pk 

cleos create account eosio eosio.saving $system_pk 

cleos create account eosio eosio.stake $system_pk 

cleos create account eosio eosio.token $system_pk 

cleos create account eosio eosio.vpay $system_pk

cleos create account eosio eosio.rex $system_pk


echo -e "\n 3. 토큰 및 msig 컨트랙트 제출."

#토큰 컨트랙트 제출
cleos set contract eosio.token ~/eosio.contracts/build/contracts/eosio.token

#msig 컨트랙트 제출
cleos set contract eosio.msig ~/eosio.contracts/build/contracts/eosio.msig


echo -e "\n 4. creat, issue 액션 제출."

cleos push action eosio.token create '[ "eosio", "10000000000.0000 SYS" ]' -p eosio.token@active

cleos push action eosio.token issue '[ "eosio", "1000000000.0000 SYS", "memo" ]' -p eosio@active


echo -e "\n 4.curl. 만약 지갑 unlock 안하고 실행시, clear 하고 다시 진행할 것 추천"

curl --request POST \
    --url http://127.0.0.1:8888/v1/producer/schedule_protocol_feature_activations \
    -d '{"protocol_features_to_activate": ["0ec7e080177b2c02b278d5088611686b49d739925a92d9bfcacd7fc6b74053bd"]}'



exit 0;
