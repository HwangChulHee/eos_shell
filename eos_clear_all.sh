#! /bin/bash


clear


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


echo -e "\n 1.노드 중지\n"

#genesis 프로듀서 stop
cd "$dir/genesis"
"./stop.sh"

for node in "${node_arr[@]}"
	do
		cd "$dir/$node"
		"./stop.sh"
		echo -e "\n $node 노드 중지\n"
	done


echo -e "\n 2.블록체인 삭제\n"

#genesis 프로듀서 clear
cd "$dir/genesis"
"./clear.sh"

for node in "${node_arr[@]}"
	do
		cd "$dir/$node"
		"./clear.sh"
		echo -e "\n $node 노드 클리어\n"
	done



#lsof 실행. 포트 숫자에 따라 i 설정해둘 것
echo -e "\n 3.포트점유 확인. 목록뜨면 kill pid번호 할 것.\n"
for((i=0; i<=0; i++))
	do
		lsof -i:901$i
	done

for((i=1; i<=9; i++))
	do
		lsof -i:910$i
	done

for((i=10; i<=26; i++))
	do
		lsof -i:91$i
	done


exit 0;
