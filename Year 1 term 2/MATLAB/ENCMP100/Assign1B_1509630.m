% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course: ENCMP 100
% Assigment: 1B
% Name: Nicholas Hoffmann
% CCID: nrhoffma
% U of A ID: 1509630
%
% Acknowledgements:
%
% Description: 
% This program will calculate an overall mark based on the given assignment,
% midterm and final marks and there relative weightings.
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; clc;

% Weighting of each section
AssignmentWeight = 0.25;
MidtermWeight = 0.25;
FinalWeight = 0.5;

% Generate an array for the assignment grades
% The second number is the number of assignments
Assignments = zeros(1,5);

% Display top sentence 
disp('ENCMP100 Final Mark Calculator');
disp('Please enter the following information in percent.');

% Loop for inputting the assignment marks
for i = 1:numel(Assignments)
    fprintf('Assignment #%i: ', i);
    Assignments(i) = input('');
end

% Midterm and Final inputs
Midterm = input('Mid term Exam: ');
Final = input('Final Exam: ');

% Calculating the average on the assignments
AssignmentAverage = sum(Assignments)/numel(Assignments);

% Calculating Overall average 
Average = Final*FinalWeight + Midterm*MidtermWeight + AssignmentAverage*AssignmentWeight;

% Display bottom sentence
disp('Your calculated final mark for ENCMP100 is :');

% Display average
disp(Average);