#! /bin/bash

pk="EOS88QpBHpd8HBsaY6fLh7ZJ4BogwFXQ76b9viTWyCGjiD9DZJwM4"


clear

echo -e "\n 1. system 컨트랙트 제출. \n"
cleos set contract eosio ~/eosio.contracts/build/contracts/eosio.system -x 3600


echo -e "\n 2. 멀티노드 만들기, 액션 제출 \n"
cleos push action eosio setpriv '["eosio.msig", 1]' -p eosio@active

cleos push action eosio init '["0", "4,SYS"]' -p eosio@active


echo -e "\n 3. 프로듀서 등록 \n"
node_arr=()

node_arr+=("pa")
node_arr+=("pb")
node_arr+=("pc")
node_arr+=("pd")
node_arr+=("pe")
node_arr+=("pf")
node_arr+=("pg")
node_arr+=("ph")
node_arr+=("pi")
node_arr+=("pj")
node_arr+=("pk")
node_arr+=("pl")
node_arr+=("pm")
node_arr+=("pn")
node_arr+=("po")
node_arr+=("pp")
node_arr+=("pq")
node_arr+=("pr")
node_arr+=("ps")
node_arr+=("pt")
node_arr+=("pu")
node_arr+=("pv")
node_arr+=("pw")
node_arr+=("px")
node_arr+=("py")
node_arr+=("pz")


for node in "${node_arr[@]}"
	do
	    cleos system newaccount eosio --transfer $node ${pk} --stake-net "1000000.0000 SYS" --stake-cpu "1000000.0000 SYS" --buy-ram-kbytes 8192
        cleos system regproducer $node ${pk} https://levan.dev/$node
	done



#cleos system newaccount eosio --transfer producer1 ${pk_p1} --stake-net "100000000.0000 SYS" --stake-cpu "100000000.0000 SYS" --buy-ram-kbytes 8192
#cleos system regproducer producer1 ${pk_p1} https://levan.dev/producer1

#cleos system newaccount eosio --transfer producer2 ${pk_p2} --stake-net "100000000.0000 SYS" --stake-cpu "100000000.0000 SYS" --buy-ram-kbytes 8192
#cleos system regproducer producer2 ${pk_p2} https://levan.dev/producer2



echo -e "\n 4. 프로듀서 투표. \n"
cleos system voteproducer prods pa pa pb pc pd pe pf pg ph pi pj pk pl pm pn po pp pq pr ps pt pu
cleos system voteproducer prods pb pa pb pc pd pe pf pg ph pi pj pk pl pm pn po pp pq pr ps pt pu
cleos system voteproducer prods pc pa pb pc pd pe pf pg ph pi pj pk pl pm pn po pp pq pr ps pt pu pv pw px py pz

cleos system listproducers


echo -e "\n 5. 권한 변경. \n"

cleos push action eosio updateauth '{"account": "eosio.bpay", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.bpay@owner
cleos push action eosio updateauth '{"account": "eosio.bpay", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.bpay@active

cleos push action eosio updateauth '{"account": "eosio.msig", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.msig@owner
cleos push action eosio updateauth '{"account": "eosio.msig", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.msig@active

cleos push action eosio updateauth '{"account": "eosio.names", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.names@owner
cleos push action eosio updateauth '{"account": "eosio.names", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.names@active

cleos push action eosio updateauth '{"account": "eosio.ram", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.ram@owner
cleos push action eosio updateauth '{"account": "eosio.ram", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.ram@active

cleos push action eosio updateauth '{"account": "eosio.ramfee", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.ramfee@owner
cleos push action eosio updateauth '{"account": "eosio.ramfee", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.ramfee@active

cleos push action eosio updateauth '{"account": "eosio.saving", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.saving@owner
cleos push action eosio updateauth '{"account": "eosio.saving", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.saving@active

cleos push action eosio updateauth '{"account": "eosio.stake", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.stake@owner
cleos push action eosio updateauth '{"account": "eosio.stake", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.stake@active

cleos push action eosio updateauth '{"account": "eosio.token", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.token@owner
cleos push action eosio updateauth '{"account": "eosio.token", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.token@active

cleos push action eosio updateauth '{"account": "eosio.vpay", "permission": "owner", "parent": "", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.vpay@owner
cleos push action eosio updateauth '{"account": "eosio.vpay", "permission": "active", "parent": "owner", "auth": {"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": "active"}}]}}' -p eosio.vpay@active


exit 0;
