"""
Daily Programmer 274-Easy
AUTHOR: Keith Stellyes
WRITTEN: August 25, 2016
https://www.reddit.com/r/dailyprogrammer/comments/4r8fod/20160704_challenge_274_easy_gold_and_treasure_the/
"""

doi = open("doi.txt","r").read()
cipher = open(input("Ciphertext:"),"r").read().split(",")
keys = []

index = 0

while index < len(doi):
    if doi[index].isalpha():
        keys.append(doi[index])
    try:
        index+=doi[index:].index(" ")
    except ValueError:
        # This will be reached if there's no more spaces, this will escape 
        # the loop.
        break
    index+=1

for el in cipher:
    print(keys[int(el)-1],end="")

#make new line for clean output.
print()
