#include<iostream>
using namespace std;
int main()
{
    int n = 2;
    float a[3][3]={4.0,2.0,3.0,2.0,2.0,1.0,2.0,2.0,2.0};
    //float u[n][n];float l[n][n];
    float b[3]={2.0,1.0,2.0};float x[3];float y[3];
    for(int j=0;j<=2;j++)
        {
             for(int k=0;k<=2;k++)
             {
                cout<<a[j][k]<<"\t";
             }
             cout<<endl;
        }
     cout<<endl; cout<<endl;  
    /*for(int k=0;k<=2;k++)
        {
            l[k][k]=1;
        }*/
    for(int k=0;k<=n;k++)
    {    
        for(int i=0;i<=k-1;i++)
        {   
            //l[k][i]=a[k][i];
            for(int j=0;j<=i-1;j++)
            {
              a[k][i]=a[k][i]-a[k][j]*a[j][i];
            }
            a[k][i]=a[k][i]/a[i][i];
            //cout<<"l["<<k<<"]["<<i<<"] = "<<l[k][i]<<"\t";
        }
        
        for(int i=k;i<=n;i++)
        {   
            //u[k][i]=a[k][i];
            for(int j=0;j<=k-1;j++)
            {
              a[k][i]=a[k][i]-a[k][j]*a[j][i];
            }
            //cout<<"u["<<k<<"]["<<i<<"] = "<<u[k][i]<<"\t";
        }
        cout<<endl;
    } 
    for(int j=0;j<=2;j++)
        {
             for(int k=0;k<=2;k++)
             {
                cout<<a[j][k]<<"\t";
             }
             cout<<endl;
        }
        /*for(int j=0;j<=n;j++)
        {
             y[j] = b[j]; 
             
             for(int k=0;k<=j-1;k++)
             {
                y[j]=y[j] - y[k]*l[j][k];
             }
             cout<<"y["<<j<<"] = "<<y[j]<<"\t";
        }
        cout<<endl;
        for(int j=n;j>=0;j--)
        {
             x[j] = y[j]; 
             for(int k=n;k>=j+1;k--)
             {
                x[j]=x[j] - x[k]*u[j][k];
             }
             x[j]=x[j]/u[j][j];
             cout<<"x["<<j<<"] = "<<x[j]<<"\t";
        }*/
        
        
    
}
