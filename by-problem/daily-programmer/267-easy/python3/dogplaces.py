"""
AUTHOR: Keith Stellyes
WRITTEN: August 28, 2016
This is a solution to a problem posted to Reddit's dailyprogrammer board.
It also meets the bonus requirements.

Taken from:
https://www.reddit.com/r/dailyprogrammer/comments/4jom3a/20160516_challenge_267_easy_all_the_places_your/

DESCRIPTION:
Your dog just won X place in a dog show, congratulations! You post your star's 
photo and placement announcement to /r/aww and, predictably, a funny redditor
asks what places the rest of the participating dogs took. Your job is to create
a program that lists all places within the range of 0-100 in spoken English, 
excluding the placing (X) of your winning pup.

INPUT DESCRIPTION:
Input is the integer placement of your dog (X) within the range 0-100.

OUTPUT DESCRIPTION:
A reader should see a neatly formatted list of placements from 0-100 in spoken 
English, excluding your dog's placement.

BONUS
Bonus 1) Allow scaling greater than 100 placings
Bonus 2) Exclude 0th place
Bonus 3) Accurately represent the unique cases 11, 12, and 13
"""
# 0:th  12:th
# 1:st  13:th
# 2:nd  else:th
# 3:rd 
# 11:th

def all_places_but(n,limit=100):
    results = []
    for i in range(1,limit+1):
        #Except 1 through 3, all numbers below 21 end in -th
        if i < 21:
            if i > 3:
                results.append(str(i)+"th")
            else:
                if i == 1:
                    results.append("1st")
                elif i == 2:
                    results.append("2nd")
                else:
                    results.append("3rd")
        else:
            if (i//10) % 10 == 1:           #check if second-to-last-digit is 1                   
                results.append(str(i)+"th") #this relies on the fact in English
                                            #, when the second-to-last digit is
                                            #1, it'll always end in -th
            else:
                test_var = i % 10
                if test_var == 0 or test_var > 3:
                    results.append(str(i) + "th")
                else:
                    if test_var == 1:
                        results.append(str(i)+"st")
                    elif test_var == 2:
                        results.append(str(i)+"nd")
                    else:
                        results.append(str(i)+"rd")
    # Remove the nth dog place. 
    # Faster to remove it after the fact, rather than testing for it during
    # generation.
    del results[int(n)-1]
    return results

if __name__ == "__main__":
    print(", ".join(all_places_but(input("What place did you dog win?"))))
