# From hackerrank.com 's algorithms unit, "Simple Array Sum"
# Two lines of input are given as follows:
# number of integers in array
# array elements separated by spaces
# The program must return the sum of the elements.
# Example:

#INPUT
# 6
# 1 2 3 4 10 11

#OUTPUT
#31

read arr_len
read arr_els

arr=($arr_els)

i=0
sum=0

while [ $i -lt $arr_len ]
do
    let sum+=${arr[$i]}
    let i+=1
done

echo $sum
