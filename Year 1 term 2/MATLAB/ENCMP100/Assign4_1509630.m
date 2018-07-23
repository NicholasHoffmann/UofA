%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Course: ENCMP 100
Assignment: 4
Name: Nicholas Hoffmann
CCID: nrhoffma
U of A ID: 1509630

Acknowledgements:

Description: 
This program caculates medal standings for the Olympics.
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% primary function
function [] = Assign4_1509630(file)

% load the file
% check if a predefined file has been selected otherwise set it as default.
if exist('file','var')
    
    if exist(file,'file')
        load(file);
    else
        fprintf('Specified file does not exist, the default has been selected.\n');
        load('olympics.mat');
    end
else
    load('olympics.mat');
end

%count all the medals
medalCount = countMedals(countries, bronze, silver, gold);

%print the chart
printChart(medalCount);

%display extra characteristics with this file
for i = 1:3 
    specialFinds(medalCount,i);
end
end

%% calculating of medals function
function medalCount = countMedals(countries,bronze,silver,gold)

%record the size of the data
dimCountries = size(countries);

%assume every medal variable is the same length
dimMedals = size(gold);

%create a new empty array with four extra columns 
%for gold, silver, bronze and total columns
medalCount = zeros(dimCountries(1), dimCountries(2) + 4);

%fill the known countries
medalCount(:,1:3) = countries;

%This loops through every country
for i = 1:dimCountries(1)
    %This loops through the medals chart
    for c = 1:dimMedals(1)
        %find the gold medals
        if isequal(medalCount(i,1:3), gold(c,1:3))
            medalCount(i,4) = medalCount(i,4) + 1;
        end
        %find the silver medals
        if isequal(medalCount(i,1:3),silver(c,1:3))
            medalCount(i,5) = medalCount(i,5) + 1;
        end
        %find the bronze medals
        if isequal(medalCount(i,1:3),bronze(c,1:3))
            medalCount(i,6) = medalCount(i,6) + 1;
        end
    end  
end

% find XXX countries
invalidCountries = find(string(char(medalCount(:,1:3))) == 'XXX');
% store old chart
oldMedalCount = medalCount;
%clear chart and resize dimensions
medalCount = zeros(dimCountries(1) - length(invalidCountries), 7);

rowNumber = 0;
for i = 1:dimCountries(1)
    if string(char(oldMedalCount(i,1:3))) ~= 'XXX'
        %if it doesnt find the string XXX it will re-store the row
        medalCount(i - rowNumber,:) = oldMedalCount(i,:);
    else 
        %if it finds X, record it so the next one moves upwards preventing
        %zeroed out rows
        rowNumber = rowNumber + 1;
    end
end

%sum the total medals for every country and refresh the size 
dimCountries = size(medalCount);
for i = 1:dimCountries(1)
    medalCount(i,end) = sum(medalCount(i,4:6));
end
end

%% This function prints the data
function printChart(chart)
%print top line
fprintf('Country Gold Silver Bronze Total\n');
%get the size of the chart
dim = size(chart);
%loop through and print the chart
for i = 1:dim(1)
    fprintf('%+7s %4i %6i %6i %5i \n', chart(i,1:3), chart(i,4), ...
        chart(i,5),chart(i,6), chart(i,7));
end
end

%% other characteristics of the data is calculated here
%this function performs other tasks such as find the countries with the
%most medals, find the countries with the most gold medals and find every
%country that has 20 or more total medals
function  specialFinds(chart, type)

%record the size of the chart
dimChart = size(chart);
%for storing the largest found value
largerstValue = 0;

switch type
    case 1
        %countries with the most medals
        fprintf('\nCountries with the most medals: ');
        for i = 1:dimChart(1)
            if chart(i,7) > largerstValue
                largerstValue = chart(i,7);
            end
        end
        
        %column has the summation of medals
        %check for ties
        numberOfTies = length(find(chart(:,7) == largerstValue));
        
        %see how many countries need to be printed
        index = find(chart(:,7) == largerstValue);
        for i = 1:numberOfTies
            %print each country
            fprintf('%s',char(chart(index(i),1:3)));
            if i < numberOfTies
                %add comma and space between each country
                fprintf(', ');
            else
                %if it is the end add a period
                fprintf('.\n');
            end
        end
        
    case 2
        %Countries with most gold medals
        fprintf('Countries with the most gold medals: ');
        for i = 1:dimChart(1)
            if chart(i,4) > largerstValue
                largerstValue = chart(i,4);
            end
        end
        
        %column 4 has the gold medals
        %check for ties
        numberOfTies = length(find(chart(:,4) == largerstValue));
        
        %check how many countries have to be printed
        index = find(chart(:,4) == largerstValue);
        for i = 1:numberOfTies
            fprintf('%s',char(chart(index(i),1:3)));
            if i < numberOfTies
                %add a comma and space between each country
                fprintf(', ');
            else
                %add a period if it is the end of the list
                fprintf('.\n');
            end
        end
        
    case 3
        %Column 7 has the summation of the medals
        %Countries with atleast 20 medals
        index = find(chart(:,7) >= 20);
        fprintf('Countries with at least twenty medals: ');
        for i = 1:length(index)
            fprintf('%s',chart(index(i),1:3));
            if i < length(index)
                %add a space and comma between each country
                fprintf(', ');
            else
                %add a period at the end of the list
                fprintf('.\n\n');
            end
        end
end
end