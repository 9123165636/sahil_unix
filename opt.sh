fault=0
dist=0
k=0
echo "\nEnter total number of pages:"
read n
echo "\nEnter sequence:"
for((i=0;i<n;i++))
do 
read pg[i]
done
echo "\n Enter frame size::"
read f
for((i=0;i<f;i++))
do
count[i]=0 
fr[i]=-1
done
for((i=0;i<n;i++))
do
flag=0
temp=${pg[i]}
for((j=0;j<f;j++))
do
if [`$temp` -eq `${fr[j]}` ]
then
flag=1
break;
fi
done
if [ `$flag -eq 0` && `$k -lt $f` ]
then
fault=`$((fault+1))`
fr[k]=temp
k=$((k+1))
elif [ `$flag -eq 0` && `$k -eq $f` ]
then
fault=`$((fault+1))`
for((cnt=0;cnt<f;cnt++))
do
current=fr[cnt]
for((c=i;c<n;c++))
do
if [ `$current` -ne `${pg[c]}` ]
then
count[cnt]=$((count[cnt]+1))
else
break;
fi
done
done
max=0
for((m=0;m<f;m++))
do
if [ `${count[m]}` -gt `$max` ]
then
max=`${count[m]}`
p=$m
fi
done
fr[p]=$temp
fi
echo "\n"
for((x=0;x<f;x++))
do
echo ${fr[x]}
done
done
echo "\nTotal number of faults=$fault"
