#! /bin/bash


dir=~/eos


#producer 추가. producer 숫자에 따라 i 설정해둘것

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


#hard_start 실행
for node in "${node_arr[@]}"
	do
		cd "$dir/$node"
		"./genesis_start.sh"
		echo -e "\n $node 노드 제네시스 스타트"
		sleep 2
	done


echo -e "\n node all genesis_start.. \n"

exit 0;
