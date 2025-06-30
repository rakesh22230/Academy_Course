#!/bin/bash

read -p "Enter the number of processes: " nop
ps=()
for ((i=0; i<nop; i++)); do
  read -p "Enter process(P$((i+1))) Size: " ps[i]
done

read -p "Enter the number of Blocks: " nob
bs=()
for ((i=0; i<nob; i++)); do
  read -p "Enter Block(B$((i+1))) Size: " bs[i]
done

allocation=()
fragmentation=()
for ((i=0; i<nop; i++)); do
  allocation[i]=-1
  fragmentation[i]=0
done

for ((i=0; i<nop; i++)); do
  for ((j=0; j<nob; j++)); do
    if ((ps[i] <= bs[j])); then
      allocation[i]=$j
      fragmentation[i]=$((bs[j] - ps[i]))
      bs[j]=-1
      break
    fi
  done
done

echo -e "\nProcess Size\tBlock Size\tAllocated\tFragmentation"
for ((i=0; i<nop; i++)); do
  echo -ne "P$((i+1))\t\t${ps[i]}\t\t"
  if ((allocation[i] != -1)); then
    echo -e "B$((allocation[i] + 1))\t\tYes\t\t${fragmentation[i]}"
  else
    echo -e "-\t\tNo\t\t-"
  fi
done
