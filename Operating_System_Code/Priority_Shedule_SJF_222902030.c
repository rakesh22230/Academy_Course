#include<stdio.h>

int pid[10], bt[10], wt[10], tat[10], pr[10];
int n, sum_wt = 0, sum_tat = 0, avg_wt = 0, avg_tat = 0;

void Calculated_Waiting_Time() {
    wt[0] = 0;
    for (int i = 1; i < n; i++) {
        wt[i] = bt[i - 1] + wt[i - 1];
        sum_wt += wt[i];
    }
}

void Calculated_TAT() {
    for (int i = 0; i < n; i++) {
        tat[i] = bt[i] + wt[i];
        sum_tat += tat[i];
    }
}

int main() {
    printf("Enter the number of processes: ");
    scanf("%d", &n);

    for (int i = 0; i < n; i++) {
        pid[i] = i + 1;
        printf("Enter the burst time for process P%d: ", i + 1);
        scanf("%d", &bt[i]);
        printf("Enter the priority of process P%d: ", i + 1);
        scanf("%d", &pr[i]);
    }

    // Sorting by priority, then by burst time for SJF
    for (int j = 0; j < n - 1; j++) {
        for (int k = j + 1; k < n; k++) {
            if (pr[j] > pr[k] || (pr[j] == pr[k] && bt[j] > bt[k])) {
                int temp = pr[j];
                pr[j] = pr[k];
                pr[k] = temp;

                temp = bt[j];
                bt[j] = bt[k];
                bt[k] = temp;

                temp = pid[j];
                pid[j] = pid[k];
                pid[k] = temp;
            }
        }
    }

    Calculated_Waiting_Time();
    Calculated_TAT();

    avg_tat = sum_tat / n;
    avg_wt = sum_wt / n;

    printf("\nPROCESS\t\tPRIORITY\tBURST TIME\tWAITING TIME\tTURN AROUND TIME\n");
    for (int i = 0; i < n; i++) {
        printf("P%d\t\t%d\t\t%d\t\t%d\t\t%d\n", pid[i], pr[i], bt[i], wt[i], tat[i]);
    }

    printf("\nAverage Waiting Time: %d\n", avg_wt);
    printf("Average Turn Around Time: %d\n", avg_tat);

    return 0;
}
