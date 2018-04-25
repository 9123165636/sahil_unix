
int count[10],i,j,k,fault,f,flag,temp,current,c,dist,max,m,cnt,p,x;
fault=0
dist=0
k=0
echo “\nEnter frame size::
read f
//initilizing distance and frame array
for((i=0;i<f;i++))
do
count[i]=0;
fr[i]=-1;
done
for((i=0;i<n;i++))
do
flag=0;
temp=pg[i];
for((j=0;j<f;j++))
do
if(temp==fr[j])
then
flag=1;
break;
fi
done
if((flag==0)&&(k<f))
then
fault++;
fr[k]=temp;
k++;
elif ((flag==0)&&(k==f))
then
fault++;
for((cnt=0;cnt<f;cnt++))
do
current=fr[cnt];
for((c=i;c<n;c++))
do
if(current!=pg[c])
then
count[cnt]++;
else
break;
fi
done
done
max=0;
for((m=0;m<f;m++))
do
if(count[m]>max)
then
max=count[m];
p=m;
fi
done
fr[p]=temp;
done
echo "\n”
for((x=0;x<f;x++))
do
echo ${fr[x]}
done
fi
echo "\nTotal number of faults=$fault"




