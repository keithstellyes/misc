#############################################################################
# Project Euler 001                                                         #
# # The sum of all multiples of 3 and 5 less than 1000                      #
# Bash shell                                                                #
# By Keith Stellyes                                                         #
# August 25, 2016                                                           #
# I give a very in-depth explanation in the Java implementation's comments. #
#############################################################################


sum3=$(expr 999 / 3)
sum3=$(expr $sum3 \* $(expr $sum3 + 1))
sum3=$(expr $sum3 \* 3)
sum3=$(expr $sum3 / 2)

sum5=$(expr 999 / 5)
sum5=$(expr $sum5 \* $(expr $sum5 + 1))
sum5=$(expr $sum5 \* 5)
sum5=$(expr $sum5 / 2)

sum15=$(expr 999 / 15)
sum15=$(expr $sum15 \* $(expr $sum15 + 1))
sum15=$(expr $sum15 \* 15)
sum15=$(expr $sum15 / 2)


echo $(expr $sum3 + $sum5 - $sum15)
