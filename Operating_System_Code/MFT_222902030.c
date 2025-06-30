#include<stdio.h>
int ms,bs,mr[10],tb,i,n;
int main()
{
    printf("Enter the Total Memory available in memory (in bytes): ");
    scanf("%d",&ms);
    printf("Enter the block size: ");
    scanf("%d",&bs);
    printf("Enter the number of process (in bytes): ");
    scanf("%d",&n);

    for(i=0; i<n; i++)
    {
        printf("Enter the memory required for process P%d: ",i+1);
        scanf("%d",&mr[i]);
    }

    tb = ms/bs;
    printf("\nNo of Block available in memory: %d\n",tb);

    printf("\nPROCESS\tMEMORY REQUIRMENT\tALLOCATED\tINTERNAL FRAGMENTATION\n");
    int sum = 0, ub = 0;
    for(i=0; i<n && ub<tb; i++)
    {
        if(mr[i]<=bs)
        {
            printf("\n%d\t\t%d\t\tYES\t\t%d\n",i+1,mr[i],bs-mr[i]);
            sum+=bs-mr[i];
            ub++;
        }
        else
        {
            printf("\n%d\t\t%d\t\tNO\t\t-----\n",i+1,mr[i]);
        }
    }
    if(i<n+1)printf("Memory is Full. Memory can't be allocated.\n");
    printf("\nInternal Fragmentation: %d",sum);
    printf("\nExternal Fragmentation: %d",ms%bs);
    return 0;
}
