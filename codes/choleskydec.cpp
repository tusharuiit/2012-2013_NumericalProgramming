#include<iostream>
#include<cmath>
using namespace std;
int main()
{
    int n = 2;
    float a[3][3]={25.0,15.0,-5.0,15.0,18.0,0.0,-5.0,0.0,11.0};
    float u[n][n];float l[n][n];
    //float b[3]={2.0,1.0,2.0};float x[3];float y[3];
    for(int j=0;j<=2;j++)
        {
             for(int k=0;k<=2;k++)
             {
                cout<<a[j][k]<<"\t";
             }
             cout<<endl;
        }
     cout<<endl; cout<<endl;  
    
    for(int k=0;k<=n;k++)
    {    
        l[k][k]=a[k][k];
        for(int i=0;i<=k-1;i++)
        {
            l[k][k]=l[k][k]-l[k][i]*l[k][i];
        }        
        l[k][k]=sqrt(l[k][k]);
        for(int i=k+1;i<=n;i++)
        {  
           l[i][k]=a[i][k];
           for(int j=0;j<=k-1;j++)
           {
               l[i][k]=l[i][k] - l[i][j]*l[k][j];
           }
           l[i][k]=l[i][k]/l[k][k];
        }
        
    }
        for(int i=0;i<=n;i++)
        {  
           for(int j=0;j<=i;j++)
           {
               cout<<l[i][j]<<"\t";
           }
           cout<<endl;          
        } 
        
}
