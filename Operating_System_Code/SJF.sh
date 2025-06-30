#!/bin/bash

declare -a pid bt wt tat
sum_tat=0
sum_wt=0

read -p "Enter the number of process: " n

for((i=0;i<n;i++)); do
  pid[i]=$((i+1))
  read -p "Enter the burst time for process P$((i+1)): " bt[i]
done

# sorting for SJF algorithm
for((j=0;j<n;j++));do
  for((k=j+1;k<n;k++));do
    if((bt[j]>bt[k])); then
       temp=${bt[j]}
       bt[j]=${bt[k]}
       bt[k]=$temp

       temp=${pid[j]}
       pid[j]=${pid[k]}
       pid[k]=$temp
    fi
  done
done

# Waiting time calculated
wt[0]=0
for((i=1;i<n;i++));do
 wt[i]=$((bt[i-1]+wt[i-1]))
 sum_wt=$((sum_wt+wt[i]))
done

# Turn around time calculated
for((i=0;i<n;i++));do
 tat[i]=$((bt[i]+wt[i]))
 sum_tat=$((sum_tat+tat[i]))
done

# Calculated Average Waiting time & average turn around time
avg_tat=$(( sum_tat/n ))
avg_wt=$(( sum_wt/n ))

echo -e "\nPROCESS\tBURST TIME\tWAITNG TIME\tTURN AROUND TIME"
for((i=0;i<n;i++));do
  echo -e "P${pid[i]}\t${bt[i]}\t\t${wt[i]}\t\t${tat[i]}"
done

echo -e "\nAverage Waiting time: $avg_wt"
echo -e "Average Turn Around Time: $avg_tat"

