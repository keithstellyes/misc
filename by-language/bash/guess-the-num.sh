n=$(shuf -i1-10 -n1)
guess=""

while [ "$n" != "$guess" ]; do
    echo "Take a guess:"
    read guess
    if [ "$n" == "$guess" ]; then
        echo "Good guess!"
    else
        echo "Incorrect guess, try again!"
    fi
    echo
done
