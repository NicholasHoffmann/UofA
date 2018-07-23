%{

function created by nicholas hoffmann.
will

prime number function. 

getPrimes(numberWanted) 
returns the prime number specified.
i.e getPrimes(1000)
returns the thousandth prime number

getPrimes('clear')
clears the known variables data

getPrimes(numberWanted, 'all')
returns a table of prime numbers up to the number wanted

%}



%% primary function
function [value] = getPrimes(amount, version)

%check if a file exists
if exist('primeNumbers.mat', 'file') ~= 2
    %if no file has been found
    newPrimeNumbers = [1,2;2,3;3,5];
    save('primeNumbers.mat','newPrimeNumbers');
    fprintf('variable file has been generated!\n');
    
elseif isequal(amount,'clear')
    %the user may choose to reset an existing file
    newPrimeNumbers = [1,2;2,3;3,5];
    save('primeNumbers.mat','newPrimeNumbers');
    fprintf('new file has been created!\n');
else
    %otherwise use the function normally
    
    %load file
    load('primeNumbers.mat');
    
    %store known primeNumbers
    primeNumbers = newPrimeNumbers;
    
    %get new primeNumbers
    newPrimeNumbers = zeros(amount,2);
    
    %record the size of the old prime number set
    dim = size(primeNumbers);
    
    %if the user does not want a table and the value is already stored, get
    %prime number
    if ~exist('version','var') && amount<dim(1)
        value = primeNumbers(amount,2);
    else
        
        %something
        index = zeros(1,amount);
        
        %restore the known values
        newPrimeNumbers(1:dim(1),1:2) = primeNumbers;
        
        %if the amount selected is smaller than the already known
        %dimensions
        if amount<dim(1)
            index(:) = primeNumbers(1:amount,2);
            indexOfPrimeNumber = length(index(end));
            number = index(end);
        else
            index(1:dim(1)) = primeNumbers(:,2);
            indexOfPrimeNumber = dim(1);
            number = index(dim(1));
        end
        
        %while the last prime number is not found
        while index(amount) == 0
            
            %check if the number is prime
            if checkIfPrime(number)
                index(indexOfPrimeNumber) = number;
                indexOfPrimeNumber = indexOfPrimeNumber + 1;
                number = number + 2;
                clc;
                fprintf('Finding %i of %i\n',indexOfPrimeNumber-1, ...
                    length(index));
            else
                number = number + 1;
            end
        end
        
        %if the file is larger, save it
            for i = 1:amount
                newPrimeNumbers(i,1:2) = [i,index(i)];
            end
            save('primeNumbers.mat','newPrimeNumbers');
        
        
        %if the user chooses to display a pre-defined format
        if exist('version','var')
            if isequal(version, 'all')
                for i = 1:amount
                    fprintf('%i\t\t%i\n',i,index(i));
                end
            else
                fprintf('Selected version does not exist.\n');
            end
        else
            %default return
            value = index(amount);
        end
    end
end
end


%% prime number check
% this function takes in a number and either returns true or false based on
% whether the number is prime
function isPrime = checkIfPrime(number)

isPrime = true;
%check common ones to increase speeds
 if mod(number,2) == 0
     isPrime = false;
 elseif mod(number,3) == 0
     isPrime = false;
 else
    for i = 4:number-1
        if mod(number,i) == 0
            isPrime = false;
        end 
    end
end
end