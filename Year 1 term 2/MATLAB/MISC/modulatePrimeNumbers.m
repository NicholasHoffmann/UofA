function modulatePrimeNumbers(numberOfPrimes,boolean)
%{

%}
%% find the dimensions of the array
%first we must find the dimensions to store the numbers;
% make sure all of the prime numbers have been found

getPrimes(numberOfPrimes);
fprintf('All prime numbers have been calculated!\n');

numberOfColumns = 0;
numberOfRows = 0;
for i = 2:numberOfPrimes
    primeNumber = getPrimes(i);
    period = modulate(primeNumber);
    % we will assume that the (p-1) is the most common and thus the number
    % of columns needed
    if period == (primeNumber-1)
        numberOfColumns = numberOfColumns+1;
    else
        % if it isnt the first row we can use this chance to figure out the
        % number of rows that are gonna be needed
        row = 2;
        %find which row this number is on
        while (primeNumber-1)/row ~= period
            row = row+1;
        end
        %if this particular row is larger than the number stored, set it as
        %the largest.
        if row > numberOfRows
            numberOfRows = row;
        end
    end
end
%print out a statement for the user to see what progress has been made.
fprintf('Dimensions of array has been found! \n row = %i\n columns = %i\n',...
    numberOfRows,numberOfColumns);

if exist('boolean','var')
    if boolean == true
        %generate the matrix that will store all of primes
        organizedNumbers = zeros(numberOfRows,numberOfColumns);
        %% organize the prime numbers based on there period
        for i = 2:numberOfPrimes
            % get the prime number
            primeNumber = getPrimes(i);
            % get the period of the prime number
            period = modulate(primeNumber);
            
            %find the row of this prime number
            row = 1;
            while (primeNumber-1)/row ~= period
                row = row+1;
            end
            
            % find the column this number has to be
            % every row has a different amount of numbers so this is neccassary
            column = 1;
            while organizedNumbers(row,column) ~= 0
                column = column+1;
            end
            
            % store the number in the space
            organizedNumbers(row,column) = primeNumber;
        end
        
        %fprintf('excel table has been saved!\n');
       % saveTable();
       %printToWindow();
       percentageOfEachRowFunction();
    end
end

%% save the table to excel
    function saveTable()
        % This is a save table function that allows the user to
        period = cell(129,1);
        for i = 1:129
            period{i} = char(string(i));
        end
        filename = 'organizedPrimes.xlsx';
        n = organizedNumbers;
        T = table(n,'RowNames',period);
        writetable(T,filename,'Sheet',1);
    end

%% this function will calculate the percentage of each row
    function percentageOfEachRowFunction()
        dim = size(organizedNumbers);
        percentageOfEachRow = zeros(dim(1),1);
        for i = 1:dim(1)
            numberOfNumbersInRow = 0;
            for j = 1:dim(2)
                if organizedNumbers(i,j) ~= 0
                    numberOfNumbersInRow = numberOfNumbersInRow + 1;
                end
            end
            percentageOfEachRow(i) = 100*numberOfNumbersInRow/(numberOfPrimes-1);
        end
        n = percentageOfEachRow;
        T = table(n);
        writetable(T,'PercentageOfEachRow.xlsx','Sheet',1);
    end


%% print the data directly to the window
    function printToWindow()
        % this prints a table which is nice for testing but impractical
        printTable = true;
        if printTable
            num = 0;
            dim = size(organizedNumbers);
            for i = 1:dim(1)
                linePrinted = false;
                for j = 1:dim(2)
                    if j == 1 %&& organizedNumbers(i,1) ~= 0
                        fprintf('(p-1)/%-3i',i);
                        linePrinted = true;
                    end
                    %if organizedNumbers(i,j) ~= 0
                    fprintf('%5i ', organizedNumbers(i,j));
                    if i == 1
                        num = num+1;
                    end
                    %else
                    %break;
                    %end
                    
                end
                if linePrinted == true
                    fprintf('\n');
                end
            end
        end
    end
end