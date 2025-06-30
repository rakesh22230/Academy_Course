#include<stdio.h>
int ms,mr[10],tb,i,n;
int main()
{
    printf("Enter the Total Memory available in memory (in bytes): ");
    scanf("%d",&ms);
    printf("Enter the number of process : ");
    scanf("%d",&n);

    for(i=0; i<n; i++)
    {
        printf("Enter the memory required for process P%d  (in bytes):  ",i+1);
        scanf("%d",&mr[i]);
    }

    printf("\nPROCESS\tMEMORY REQUIRMENT\tALLOCATED\n");
    int ub = 0;
    for(i=0; i<n ; i++)
    {
        if(ub+mr[i]<=ms)
        {
            printf("\n%d\t\t%d\t\tYES\n",i+1,mr[i]);
            ub+=mr[i];
        }
        else
        {
            printf("\n%d\t\t%d\t\tNO\n",i+1,mr[i]);
        }
    }
    if(i<n+1)printf("Memory is Full. Memory can't be allocated.\n");
    printf("\nExternal Fragmentation: %d",ms-ub);
    return 0;
}

