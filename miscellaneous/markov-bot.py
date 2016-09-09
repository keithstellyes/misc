#AUTHOR: Keith Stellyes
#This is a simple example of using Pykov to generate a markov chain.
#It does the following:
#-Take the file path of a text file, then builds a chain based on it
#-makes n steps based on that

#Unfortunately, I was unable to use the walk() method, as the code in the 
#    original module is broken. I plan on doing a pull request for the fix.

#In other words, given a document, it builds a markov chain based on those
#    words, picks a random spot, then iterates n number of times

#Pykov from here: https://github.com/riccardoscalco/Pykov
import pykov
import random
import six
import sys

#some thanks to for their exaplanations:
# http://www.biochem-caflisch.uzh.ch/rscalco/pykov/getting_started.html

#usage:
# SCRIPT source_file steps

if len(sys.argv) < 3:
    print("Usage:")
    print("THIS-SCRIPT source_file steps")
    sys.exit(1)

#Building the tuple of all the words, in order, to be fed to Pykov
s = open(sys.argv[1],'r').read()
s = s.replace('\n',' ')
t = tuple(s.split(' '))

#Gets the vector and markov chain from the tuple built.
vec,chn = pykov.maximum_likelihood_probabilities(t)

#Next, we need to randomly pick a good starting point for the chain.

#More or less ripped from the original pykov source, but the code is broken.
# So here, we write a fix.
n = random.uniform(0,1)
inital = None
for state, prob in six.iteritems(chn):
    if n < prob:
        inital = state
        break
    n = n - prob

#Subtracting two steps since we have to hardcode the first two steps.
steps = int(sys.argv[2]) - 2
#sometimes it'll pick an inital first word that starts lower-case. This cfixes
print(inital[0][0].upper() + inital[0][1:], end = ' ')
print(inital[1], end = ' ')

nxt = chn.move(inital[1])
while steps:
    print(nxt, end = ' ')
    if steps == 1 and not(nxt.endswith('.') or nxt.endswith('!') or nxt.endswith('?')):
        #Call the loop again if we're not a word ending. This is to ensure
        #It always ends in a sentence.
        steps += 1
    nxt = chn.move(nxt)
    steps -= 1

print()
sys.exit(0)
