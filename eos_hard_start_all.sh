#! /bin/bash


dir=~/eos


#producer 추가. producer 숫자에 따라 i 설정해둘것

node_arr=()
for((i=1; i<=2; i++))
	do
		node_arr+=("producer$i")
	done


#hard_start 실행
for node in "${node_arr[@]}"
	do
		cd "$dir/$node"
		"./hard_start.sh"
	done


echo -e "\n node all hard_start.. \n"

exit 0;
