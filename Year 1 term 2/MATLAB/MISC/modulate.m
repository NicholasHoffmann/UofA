%{
Modulation of each number n

lets say n = 7

8-7 = 1
1*2*2*2=8

use the lowest 2^x value and remove n. multiply this by 2 until value is
greater than that value and then deduct n again.

period is 3

lets say n = 5

8-5 = 3
3*2 = 6

6-5 = 1
1*2*2*2 = 8

period is 4 for 5
n = 5
3.1.2.4

n=7
1.2.4
%}

function [period]  = modulate(number)

% find the smallest power x that is greater than n
p = 0;
while 2^p < number
    p = p+1;
end

c = 2^p-number;
% multiply this number by two until it is greater than 
period = 0;
while c ~= 2^p
    if period ~= 0
        c = c-number;
    end
    while c < number
        period = period + 1;
        c = 2*c;
    end
end

end
