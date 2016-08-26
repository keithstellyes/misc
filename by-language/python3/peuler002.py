"""
Project Euler 002
AUTHOR: Keith Stellyes
WRITTEN: August 25, 2016

Important that every 3rd number is even in the fibonacci sequence,
    this solution takes advantage of this.
"""
def fib(n):
    a,b = 1,1
    for i in range(n-1):
        a,b = b, a + b
    return a

total = 0
i = 3

while fib(i) < 4000000:
    total += fib(i)
    i+=3

print(total)
