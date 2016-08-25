[
AUTHOR: Keith Stellyes
WRITTEN: June 2016

This takes up to a 3 digit number from user, then outputs if it's even or odd.

The input is formatted like thus:
(USER WANTS TO TEST 3):
003

(USER WANTS TO TEST 242)
242
]

EVEN OR ODD

,------------------------------------------------   Get data assuming unused digits are 0
>,------------------------------------------------   & sub 48 to convert from ASCII to digit
>,------------------------------------------------ 

<[>++++++++++<-]                                    Add 10s place to 1s place
<[>>+++++++++++++++++++++++++                       Add 100s place to 1s place
+++++++++++++++++++++++++
+++++++++++++++++++++++++
+++++++++++++++++++++++++<<-]

>>>++<                                             Set cell 4 to 2 for divmod operation

[>[->+>+<<]>[-<<-[>]>>>[<[-<->]<[>]>>[[-]>>+<]>-   Divmod, next cell (4) will contain 
<]<<]>>>+<<[-<<+>>]<<<] >>>>>[-<<<<<+>>>>>]<<<<<   the result of input mod 2; If it is
                                                   1 then input is odd; otherwise even
												   
>[++++++++++++++++++++++++++++++++++++++++++++++   This block will be entered only if 
++++++++++++++++++++++++++++++++.+++++++++++++++   odd
++++++..<<]

<[++++++++++++++++++++++++++++++++++++++++++++++   This block will be entered only if 
+++++++++++++++++++++++.++++++++++++++++++++++++   even.
+++++++++++++++++++++++++.-----------------.++++
+++++.]
