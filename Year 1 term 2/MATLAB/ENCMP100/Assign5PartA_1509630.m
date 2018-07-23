%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Course: ENCMP 100
Assignment: 4A
Name: Nicholas Hoffmann
CCID: nrhoffma
U of A ID: 1509630

Acknowledgements:

Description: 
This program calculates medal standings for the Olympics.
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc;

numberOfShapes = 0;
%% selection loop
while true
    % open a dialog for the user to pick a shape
    % here is the cell array shapeList, this is the list that shows up on
    % the dialog for the shape selection
    shapeList = {'Circle','Square','Ellipse','Triangle','Rectangle'};
    [selection,ok] = listdlg('promptString','Select the next shape:',...
        'SelectionMode','single',...
        'OKstring','Enter',...
        'CancelString','No more',...
        'ListString',shapeList);
    % selection now holds the index of the selected shape
    % ok is 1 if a shape was selected; otherwise, ok is 0
    if ~ok
        break; end
    
    % open a dialog to allow the user to select dimensions for the shape
    % this the second cell array that is the lines that show up above the
    % lines that the user enters values
    prompt = {'Enter shape dimension 1','Enter shape dimension 2'};
    title = 'Shape dimension dialog box';
    numlines = 1;
    % here is the third cell array, this holds the default value of 0 that
    % shows up in the dimension selection dialog
    defaults = {'0','0'};
    
    % here is a structuture in use named options that defined how the
    % dimension window will be
    options.Resize = 'on';
    options.WindowStyle = 'normal';
    options.Interpreter = 'none';
    inputvalues = inputdlg(prompt,title,numlines,defaults,options);
    % str2num(inputvalues{1}) is the value of the first dimension
    % str2num(inputvalues{2}) is the values of the second dimension
    
    
    % dialog that asks the user to select a colour for the shape
    % here is the fourth cell array colourList, it stores every possible
    % colour the user may select
    colourList = {'red','yellow','blue','green','orange','violet'};
    [something, ok] = listdlg('promptString','Select a colour for the shape',...
        'SelectionMode','single',...
        'OKstring','Enter',...
        'CancelString','No colour',...
        'ListString',colourList);
    if ~ok
        something = '';
    end
    % count the number of shapes
    numberOfShapes = numberOfShapes + 1;
end
%% print resutls
if numberOfShapes == 0
    fprintf('No objects were entered.\n');
else
    fprintf('The number of entered objects was %i.\n',numberOfShapes);
end