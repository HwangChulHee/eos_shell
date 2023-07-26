#! /bin/bash

node1="genesis"
node2="producer1"
node3="producer2"

node_arr+=("genesis")

for((i=1; i<=22; i++))
	do
		node_arr+=("producer$i")
	done

for node in "${node_arr[@]}"
	do
		echo $node
	done





echo -e "\n test.... \n"

exit 0;
