%% caculating prime numbers
% this function will calculate prime numbers until the user does not want
% another number. it will also be able to start at a requested number.

% *A prime number is a whole number greater than 1, 
% whose only two whole-number factors are 1 and itself.*

clear; clc;
number = 2;
indexOfPrimeNumber = 1;

switch input('Select version: ')
    case 1
        %% version one, hit enter to get the next number
while true
    checkUser = input('', 's');
    fprintf('\b');
    
    if strcmp(checkUser, '')

            
            % so mod(number,1) == 0 && mod(number,number) == 0 is the only
            % thing true
            checkNumberIsPrime = true;
            loadingIncrements = 0;
            if number - 2 > 10
                loadingIncrements = ceil(length(i)/5);
                loadingIncrements = loadingIncrements - mod(number, loadingIncrements);
            end
            for i = 2:number-1
                
                    %loading bar
                    if loadingIncrements ~= 0 && mod(i,loadingIncrements) == 0 
                        fprintf('-');
                    end
                if mod(number,i) == 0
                    checkNumberIsPrime = false;
                    
                    break;
                else
                    checkNumberIsPrime = true;
                end
            end
            if checkNumberIsPrime
                fprintf('%i\t%i\n', indexOfPrimeNumber, number);
                indexOfPrimeNumber = indexOfPrimeNumber + 1;
            end
            
    else
        fprintf('\nscript has ended, thank you for using!\n');
        break;
    end
    
    
    number = number + 1;
end



    case 2
        %% here is a different approach
        %this will take a total number of wanted prime numbers
        
        
        amount = input('How many prime numbers would you like to caculate?: ');
        load('primeNumbers.mat');
        primeNumbers = newPrimeNumbers;
        newPrimeNumbers = zeros(amount,2);
        dim = size(primeNumbers);
        
        index = zeros(1,amount);
        
        if amount<dim(1)
            for i = 1:amount
                newPrimeNumbers(i,1:2) = primeNumbers(i,1:2);
            end
            index(:) = primeNumbers(1:amount,2);
            indexOfPrimeNumber = length(index(end));
            number = index(end);
        else
            for i = 1:dim(1)
                newPrimeNumbers(i,1:2) = primeNumbers(i,1:2);
            end
            index(1:dim(1)) = primeNumbers(:,2);
            indexOfPrimeNumber = dim(1);
            number = index(dim(1));
        end
        
        while index(amount) == 0
            if checkIfPrime(number)
                index(indexOfPrimeNumber) = number;
                indexOfPrimeNumber = indexOfPrimeNumber + 1;
                number = number + 1;
                clc;
                fprintf('Finding %i of %i\n',indexOfPrimeNumber, ... 
                    length(index));
            else
                number = number + 1;
            end
        end
        if dim(1) < amount
            for i = 1:amount
                fprintf('%i\t\t%i\n',i,index(i));
                newPrimeNumbers(i,1:2) = [i,index(i)];
            end
            save('primeNumbers.mat','newPrimeNumbers');
        else
            for i = 1:amount
                fprintf('%i\t\t%i\n',i,index(i));
            end
        end
        
        
    case 3

    otherwise
        fprintf('the selected version does not exist.\n');
        
end
%



%% this checks if a number is a prime number
function value = checkIfPrime(n)

value = true;
 if mod(n,2) == 0
     value = false;
 elseif mod(n,3) == 0
     value = false;
 %elseif mod(n,5) == 0
  %   value = false;
 else
    for i = 4:n-1
        if mod(n,i) == 0
            value = false;
        end 
    end
end
end