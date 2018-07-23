%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Course: ENCMP 100
Assigment: 3A
Name: Nicholas Hoffmann
CCID: nrhoffma
U of A ID: 1509630

Acknowledgements:

Description: 
This program calculates savings for college education.
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; clc;
%% declaring of variables
%This is the initial balance of the account
StartingBalance = 2000;

%This the monthly payments made into the account
monthlyContribution = 200;

%This is the monthly compounded rate of the account
monthlyCompoundRate = (6.25/12)/100; % Approximately 0.0052% increase

%These are the starting tuitions of each faculty
artsTuition = 5550;
scienceTuition = 6100;
engineeringTuition = 6550;

%This is how much the tuition increases every year
annualTuitionIncrease = 0.07; % 7% increase

%Current balance of the account
balance = StartingBalance;

%This is the savings that will be plotted
%The total savings at the end of each year will be recorded
plotBalance = zeros(1,19);
plotBalance(1) = StartingBalance;

%This cost variable is going to be plotted
costLine = zeros(1,19);

%These variables record the total cost of the four years of tuition that
%the student would be attending
RelevantArtsTuition = 0; 
RelevantScienceTuition = 0;
RelevantEngineeringTuition = 0;

%% calculating the total cost of the tuition
%We only need the sum of the final 4 years, notice how the first year is
%not compounded.
for i = 2:22

    %tuition increases every year
    artsTuition = artsTuition + (artsTuition*annualTuitionIncrease);
    scienceTuition = scienceTuition + (scienceTuition*annualTuitionIncrease);
    engineeringTuition = engineeringTuition + (engineeringTuition*annualTuitionIncrease);

    %if it is year 19 or above start summing the cost
    if i >= 19
        RelevantArtsTuition = RelevantArtsTuition + artsTuition;
        RelevantScienceTuition = RelevantScienceTuition + scienceTuition;
        RelevantEngineeringTuition = RelevantEngineeringTuition + engineeringTuition;
    end
end

%% select a program
selectedOnFirstTry = true;
codeValid = false;
while ~codeValid
    %This is the prompt for the user to pick a program
    selectedProgram = input('Select a program: 1. Arts; 2. Science; 3. Engineering: ');

    %check if the code entered is valid
    switch selectedProgram
        case 1
            codeValid = true;
            %selected the arts program
            costLine(1:end) = RelevantArtsTuition;
        case 2
            codeValid = true;
            %selected the science program
            costLine(1:end) = RelevantScienceTuition;
        case 3
            codeValid = true;  
            %selected the engineering program
            costLine(1:end) = RelevantEngineeringTuition;
        otherwise
            clc;
            fprintf('Please try again.\n\n');
            selectedOnFirstTry = false;
    end
end


%% reset the screen to remove the please try again line
if ~selectedOnFirstTry
    clc;
    fprintf('Select a program: 1. Arts; 2. Science; 3. Engineering: %i\n',...
        selectedProgram);
end

%% calculate the savings
%18*12 = 216 months
%calculate the savings
for i = 2:216
    %This is to check if it is the first month and which the compounding 
    %does not take place
        balance = balance + (balance*monthlyCompoundRate) + ...
            monthlyContribution;

    %With every 12 months that passes, record the savings for that year
    if mod(i,12) == 0
        plotBalance(i/12+1) = balance;
    end
end

%% print results
fprintf('At the end of 18 years you will have saved $ %.2f\n',balance);
fprintf('The cost of a 4-year college tuition fee is $ %.2f\n',costLine(1));

if balance >= costLine(1)
    %if the balance exceeds the cost of tuition, display this
    fprintf('Congratulations!!! You have saved enough.\n');
else
    %if the balance is below the cost of tuition, display this
    fprintf('The savings is $ %.2f short\n', costLine(1) - balance);
end

%graph the functions
plot(0:18,plotBalance,'g',0:18,costLine,'b');
title('College Savings vs. Tuition fee');
xlabel('Year');
ylabel('Balance');
axis([0,18,0,costLine(1) + costLine(1)/8]);