!Fizz Buzz :(

PROGRAM fizzbuzz

IMPLICIT NONE

integer :: i, modresult_three, modresult_five

i=1

do while (i <= 100)
    modresult_three = mod(i, 3)
    modresult_five  = mod(i, 5)

    if (modresult_three == 0) then
        if (modresult_five == 0) then
            write(*,*) 'FizzBuzz'
        else
            write(*,*) 'Fizz'
        endif
    elseif (modresult_five == 0) then
        write(*,*) 'Buzz'
    else
        write(*,*)i
    endif
    i = i + 1

enddo

END PROGRAM
