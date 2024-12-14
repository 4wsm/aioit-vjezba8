#!/bin/bash
while read i
do
	if [ $(($i % 3)) == 0 ]
	then
		echo $i
	fi	
done < ./'datoteka 1.txt'
