%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assignment: 2
% Name: Nicholas Hoffmann
% CCID: nrhoffma
% U of A ID: 1509630 
% 
% Acknowledgements:
%
% Description:
% This program contains four rules which can be used to crack the
% secret code to save Maverick the co-op student!
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; clc;

%input the code
code = input('Please enter a code to break: ','s');

%check if it is a nine digit number
if numel(code) ~= 9
    %print this if the number is not nine digits
    fprintf('Decoy Message: Not a nine-digit number.\n');
else
    %else continue
    %convert the string into integers
    code = code-'0';
    
    %check if the sum of the digits is even be dividing by 2 and ensuring
    %the remainder is not 1 (it will be zero if it is even)
    if mod(sum(code),2) == 1
        %print this if the sum of the digits is odd
        fprintf('Decoy Message: Sum is odd.\n');
    else
        %else continue
        %convert rescue day into its decoded value
        rescueDay = code(1)*code(3)-code(5);
        
        %convert rescue day into its readable value
        rescueDay = getRescueDay(rescueDay);
        
        %check if the rescueDay is valid (0 = invalid)
        if rescueDay == 0
            %print this if the day is invalid (not between 1 and 7)
            fprintf('Decoy message: Invalid rescue day.\n');
        else
            %else continue
            %check if if this is divisible by 3
            checkType = code(2)*code(4)-code(6);
            if mod(checkType,3) == 0
                %if it is divisible by 3, the rendezvous point decoded is
                %this
                rendezvousPoint = code(7)-code(9);
            else
                %if it isnt divisible by 3, the rendezvous point decoded is
                %this
                rendezvousPoint = code(8)-code(9);
            end
            
            %convert the rendezvous point into its readable value
            rendezvousPoint = getRendezvousPoint(rendezvousPoint);
            
            %check if the the rendezvous point is valid (0 = invalid)
            if rendezvousPoint == 0
                %if the rendezvous point value is invalid (not from 1 to 7)
                %print this
                fprintf('Decoy message: Invalid rendezvous point.\n');
            else
                %function has passed all tests and it can now be printed
                fprintf('Rescue on %s at %s.\n', rescueDay,rendezvousPoint);
            end
        end     
    end  
end
clear; %clear all variables

%convert a number value of the rescue day into its readable value, if it is
%invalid (not between 1 and 7) it will return 0 
function Day = getRescueDay(n)

switch n
    case 1
        Day = 'Monday';
    case 2
        Day = 'Tuesday';
    case 3
        Day = 'Wednesday';
    case 4
        Day = 'Thursday';
    case 5 
        Day = 'Friday';
    case 6 
        Day = 'Saturday';
    case 7
        Day = 'Sunday';
    otherwise
        Day = 0;
end
end

%convert a number value of the rendezvous point into its readable value, if it
%is invalid (not between 1 and 7) it will return 0 
function place = getRendezvousPoint(n)

switch n
    case 1
        place = 'the bridge';
    case 2
        place = 'the library';
    case 3
        place = 'the river crossing';
    case 4 
        place = 'the airport';
    case 5 
        place = 'the bus terminal';
    case 6 
        place = 'the hospital';
    case 7 
        place = 'St. Petes Church';
    otherwise
        place = 0;
end
end