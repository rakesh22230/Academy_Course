#!/bin/bash

mr=()
read -p "Enter the total memory available (in bytes): " ms
read -p "Enter the block size: " bs
read -p "Enter the number of processes: " n

for ((i=0; i<n; i++)); do
  read -p "Enter the memory required for process P$((i+1)): " mr[i]
done

tb=$((ms / bs))

echo -e "\nNumber of blocks available in memory: $tb\n"
echo -e "PROCESS\tMEMORY REQUIREMENT\tALLOCATED\tINTERNAL FRAGMENTATION"

sum=0
ub=0

for ((i=0; i<n && ub<tb; i++)); do
  if ((mr[i] <= bs)); then
    echo -e "$((i+1))\t\t${mr[i]}\t\tYES\t\t$((bs - mr[i]))"
    sum=$((sum + bs - mr[i]))
    ub=$((ub + 1))
  else
    echo -e "$((i+1))\t\t${mr[i]}\t\tNO\t\t--------"
  fi
done

if ((ub == tb && i < n)); then
  echo "\nMemory is full. Remaining processes cannot be allocated memory."
fi

ef=$((ms % bs))
echo -e "\nInternal Fragmentation: $sum"
echo -e "External Fragmentation: $ef"
