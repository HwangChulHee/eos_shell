#! /bin/bash


dir=~/eos

#genesis 프로듀서 stop
cd "$dir/genesis"
"./stop.sh"

#producer 추가. producer 숫자에 따라 i 설정해둘것

node_arr=()
node_arr+=("producer1")
node_arr+=("producer11")
node_arr+=("producer13")
node_arr+=("producer14")
node_arr+=("producer15")
node_arr+=("producer2")
node_arr+=("producer21")
node_arr+=("producer3")
node_arr+=("producer4")
node_arr+=("producer5")
node_arr+=("producereig")
node_arr+=("producereigt")
node_arr+=("producernin")
node_arr+=("producernint")
node_arr+=("producersev")
node_arr+=("producersevt")
node_arr+=("producersix")
node_arr+=("producersixt")
node_arr+=("producerten")
node_arr+=("producertwl")
node_arr+=("producertwt")
node_arr+=("producer22")


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
