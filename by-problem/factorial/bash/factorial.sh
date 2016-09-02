n=$1
result=1

until [ $n -lt 2 ]; do
    let result*=n
    let n-=1
done

echo $result

