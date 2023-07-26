#! /bin/bash


dir=~/eos

#genesis 프로듀서 stop
cd "$dir/genesis"
"./stop.sh"

#producer 추가. producer 숫자에 따라 i 설정해둘것

node_arr=()
for((i=1; i<=2; i++))
	do
		node_arr+=("producer$i")
	done


#stop 실행
for node in "${node_arr[@]}"
	do
		cd "$dir/$node"
		"./stop.sh"
	done

#lsof 실행. 포트 숫자에 따라 i 설정해둘 것
for((i=0; i<=2; i++))
	do
		lsof -i:901$i
	done


echo -e "\n node all stop.. \n"

exit 0;
