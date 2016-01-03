#include<iostream>
using namespace std;
int main()
{
    float temp;
    float a[3][3]={4.0,2.0,3.0,2.0,2.0,1.0,2.0,2.0,2.0};
    float b[3]={2.0,1.0,2.0};float x[3];
    for(int j=0;j<=2;j++)
        {
             for(int k=0;k<=2;k++)
             {
                cout<<a[j][k]<<"\t";
             }
             cout<<endl;
        }
     cout<<endl; cout<<endl;  
    for (int i = 0;i<=2;i++)
    {
        for(int j=i+1;j<=2;j++)
        {
             for(int k=i+1;k<=2;k++)
             {
                a[j][k]=a[j][k]-((a[j][i])/(a[i][i]))*(a[i][k]); 
             }
             b[j]=b[j]-(a[j][i])/(a[i][i])*(b[i]);
        }
    }
    
        for(int j=0;j<=2;j++)
        {
             for(int k=0;k<=2;k++)
             {
                cout<<a[j][k]<<"\t";
             }
             cout<<endl;cout<<endl;
        }
        for(int j=2;j>=0;j--)
        {
             temp = b[j]; 
             for(int k=2;k>=j+1;k--)
             {
                temp=temp - x[k]*a[j][k];
             }
             x[j]=temp/a[j][j];
        }
        for(int k=0;k<=2;k++)
        {
            cout<<b[k]<<"\t";
        }
             cout<<endl;cout<<endl;
       for(int k=0;k<=2;k++)
       {
            cout<<x[k]<<"\t";
       }
        
    
}
