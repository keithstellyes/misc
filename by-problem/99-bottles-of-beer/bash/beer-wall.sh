#99 bottles of beer on the wall, but in bash script

n=99
until [ $n -lt 2 ]; do
    echo "$n bottles of beer on the wall, $n bottles of beer."
    let n-=1
    echo "Take one down and pass it around, $n bottles of beer on the wall."
    echo
done

echo "1 bottle of beer on the wall, 1 bottle of beer."
echo "Take one down and pass it around, no more bottles of beer on the wall."
echo
echo "No more bottles of beer on the wall, no more bottles of beer."
echo "Go to the store and buy some more, 99 bottles of beer on the wall."
