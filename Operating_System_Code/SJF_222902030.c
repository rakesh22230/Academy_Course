// Shortest Job First Algorithm
#include<stdio.h>
int pid[10],bt[10],wt[10],tat[10],n,i;
int sum_wt=0,sum_tat=0,avg_wt=0,avg_tat=0;

Calculated_Waiting_Time()
{
    wt[0]=0;
    for(i=0; i<n; i++)
    {
        wt[i]=bt[i-1]+wt[i-1];
        sum_wt+=wt[i];
    }
}
Calculated_TAT()
{
    for(i=0; i<n; i++)
    {
        tat[i]=bt[i]+wt[i];
        sum_tat+=tat[i];
    }
}

int main()
{
    printf("Enter the number of process: ");
    scanf("%d",&n);
    for( i=0; i<n; i++)
    {
        pid[i]=i+1;
        printf("Enter the burst time for process p%d: ",i+1);
        scanf("%d",&bt[i]);
    }
    // Sorting For SJF Algorithm----------------
    for(int j=0; j<n-1; j++)
    {
        for(int k=j+1; k<n; k++)
        {
            if(bt[j]>bt[k])
            {
                int temp = bt[j];
                bt[j]=bt[k];
                bt[k] = temp;

                temp = pid[j];
                pid[j]=pid[k];
                pid[k]=temp;
            }
        }
    }

    Calculated_Waiting_Time();
    Calculated_TAT();

    avg_tat = sum_tat/n;
    avg_wt = sum_wt/n;

    printf("\nPROCESS\t\tBURST TIME\t\tWAITING TIME\t\tTURN AROUND TIME\n");
    for( i=0; i<n; i++)
    {
        printf("\nP%d\t\t%d\t\t\t%d\t\t\t%d\n",pid[i],bt[i],wt[i],tat[i]);
    }
    printf("\nAverage Waiting Time: %d\n",avg_wt);
    printf("Average Turn Around Time: %d\n",avg_tat);

    return 0;
}
