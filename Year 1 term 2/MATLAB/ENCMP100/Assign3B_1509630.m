%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Course: ENCMP 100
Assigment: 3B
Name: Nicholas Hoffmann
CCID: nrhoffma
U of A ID: 1509630

Acknowledgements:

Description: 
This program calculates savings for college education.
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; clc;
%% declaring of main variables
%This is the initial balance of the account
startingBalance = 2000;

%This is the starting monthly payments made into the account
monthlyContribution = 50;

%This is how much the monthly contribution will increase if the monthly
%contribution before was not enough to fulfill the cost of the tuition
incrementalContribution = 10;

%This is the monthly compounded rate of the account
monthlyCompoundRate = (6.25/12)/100; % Approximately 0.0052% increase

%These are the starting tuitions cost of each faculty
artsTuition = 5550;
scienceTuition = 6100;
engineeringTuition = 6550;

%This is how much the tuition increases every year
annualTuitionIncrease = 0.07; % 7% increase

%Current balance of the account
balance = startingBalance;

%These variables record the total cost of the four years of tuition that
%the student would be attending
relevantArtsTuition = 0; 
relevantScienceTuition = 0; 
relevantEngineeringTuition = 0;

%% calculate the cost of every program
%We only need the sum of the final 4 years notice how the first year is
%not compounded.
for i = 2:22
    %Tuition increases every year by the specified annual increase
    artsTuition = artsTuition + (artsTuition*annualTuitionIncrease);
    scienceTuition = scienceTuition + (scienceTuition*annualTuitionIncrease);
    engineeringTuition = engineeringTuition + (engineeringTuition*annualTuitionIncrease);

    %If it is year 19 or above start summing the cost
    if i >= 19
        relevantArtsTuition = relevantArtsTuition + artsTuition;
        relevantScienceTuition = relevantScienceTuition + scienceTuition;
        relevantEngineeringTuition = relevantEngineeringTuition + engineeringTuition;
    end
end

%% select a program
%while statement to ensure the user picks a valid program
selectedOnFirstTry = true;
codeValid = false;
while ~codeValid
    %This is the prompt for the user to pick a program
    selectedProgram = input('Select a program: 1. Arts; 2. Science; 3. Engineering: ');

    %check if the code entered is valid
    switch selectedProgram
        case 1
            %arts program has been chosen
            codeValid = true;
            selectedProgramTuition = relevantArtsTuition;
        case 2
            %Science program has been chosen
            codeValid = true;
            selectedProgramTuition = relevantScienceTuition;
        case 3
            %Engineering program has been chosen
            codeValid = true;
            selectedProgramTuition = relevantEngineeringTuition;
        otherwise
            %invalid input
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

%% Find the minimun monthly contribution required
initialLoop = true;
while balance < selectedProgramTuition
    %Check with original monthly contribution before increasing it
    if ~initialLoop
        monthlyContribution = monthlyContribution + incrementalContribution;
    end

    %Reset balance
    balance = startingBalance;

    %calculate balance
    %18*12 = 216 months, skip the first month
    for i = 2:216
        balance = balance + (balance*monthlyCompoundRate) + ...
            monthlyContribution;
    end
    initialLoop = false;
end

%% Print results
fprintf('The 4-year college tuition fee is $ %.2f\n',selectedProgramTuition);
fprintf('You will need to save $ %.2f each month to reach the goal.\n',monthlyContribution);