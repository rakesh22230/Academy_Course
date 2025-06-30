#!/bin/bash

mr=()
read -p "Enter the total memory available (in bytes): " ms
read -p "Enter the number of processes: " n

for ((i=0; i<n; i++)); do
  read -p "Enter the memory required for process P$((i+1)): " mr[i]
done

echo -e "PROCESS\tMEMORY REQUIREMENT\tALLOCATED"

sum=0
ub=0

for ((i=0; i<n ; i++)); do
  if (( ub+mr[i] <= ms )); then
    echo -e "$((i+1))\t\t${mr[i]}\t\tYES"
    ub=$((ub + mr[i] ))
  else
    echo -e "$((i+1))\t\t${mr[i]}\t\tNO"
  fi
done

if (( i < n+1 )); then
  echo "Memory is full. Remaining processes cannot be allocated memory."
fi

echo -e "External Fragmentation: $(( ms-ub ))"
