function [] = Assign5PartB_1509630()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
Course: ENCMP 100
Assignment: 5
Name: Nicholas Hoffmann
CCID: nrhoffma
U of A ID: 1509630

Acknowledgements:

Description: 
This program allows the user to create shape objects using dialog boxes.
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numberOfShapes = 0;

% here is the cell array fields that contain the fields that are to be
% stored with each object the user inputs
fields = {'No','ID','colour','firstDimension','secondDimension','area'};

%% selection loop
while true
    %% shape selector
    % open a dialog for the user to pick up a shape, here is the first cell
    % array shapelist that stores all the shapes the user may choose
    shapeList = {'Circle','Square','Ellipse','Triangle','Rectangle'};
    [shapeSelection,ok] = listdlg('promptString','Select the next shape:',...
                                'SelectionMode','single',...
                                'OKstring','Enter',...
                                'CancelString','No more',...
                                'ListString',shapeList);
    
    % check if the user selected a shape
    if ~ok
        % end the loop if the user doesnt select a shape
        break;
    end
    %% dimension selector
    % This opens a dialog for the user to enter dimensions
    % here is two other cell array are created, prompt and defaults, the
    % prompt is the name of the window and the defualts are the values that
    % originally appear within the window
    if shapeSelection == 1 || shapeSelection == 2
        % if the selected shape only requires a single dimension
        prompt = {'Enter shape dimension'};
        defaults = {'0'};
    else
        % if the selected shape requires two dimensions
        prompt = {'Enter shape dimension 1','Enter shape dimension 2'};
        defaults = {'0','0'};
    end
    
    title = 'Shape dimension dialog box';
    numlines = 1;
    % here is the structure options that define how the window of the
    % dimension dialog will be displayed
    options.Resize = 'on';
    options.WindowStyle = 'normal';
    options.Interpreter = 'none';
    dimensions = inputdlg(prompt,title,numlines,defaults,options);
    
    % store the dimensions into easier to read 
    % from the dimension dialog another cell array is produced which are
    % the values the user inputted and are currently in character arrays
    firstDimension = str2double(dimensions{1});
    if shapeSelection == 1 || shapeSelection == 2
        % if the shape only needed a single dimension, fill it with nothing
        dimensions{2} = '';
    else
        % otherwise, store the dimension
        secondDimension = str2double(dimensions{2});
    end
    %% colour selector
    % this asks the user to select a color for the shape
    % here is the cell array colourList which stores the options the user
    % has for colours of the shape
    colourList = {'Red','Yellow','Blue','Green','Orange','Violet'};
    [colourSelection, ok] = listdlg('promptString','Select a colour for the shape',...
                                    'SelectionMode','single',...
                                    'OKstring','Enter',...
                                    'CancelString','No colour',...
                                    'ListString',colourList);
    
    % check if the user selected a color
    if ok
        colour = colourList{colourSelection};
    else
        % assign a blank if one wasnt selected
        colour = '';
    end
    %% store data
    % keep track on the number of shapes
    numberOfShapes = numberOfShapes + 1;
    
    % Calculate the area of the shape
    switch shapeSelection
        case 1 % Circle
            area = pi*firstDimension^2;
        case 2 % Square
            area = firstDimension^2;
        case 3 % Ellipse
            area = pi*firstDimension*secondDimension;
        case 4 % Triangle
            area = (1/2)*firstDimension*secondDimension;
        case 5 % Rectangle
            area = firstDimension*secondDimension;
    end
    
    % store all the data as character arrays into structure array
    % here is the structure array shape which stores all data the user
    % inputted along with some other calculated data
    shape(numberOfShapes)=struct(fields{1},numberOfShapes,...
                                fields{2},shapeList{shapeSelection},...
                                fields{3},colour,...
                                fields{4},dimensions{1},...
                                fields{5},dimensions{2},...
                                fields{6},char(string(area)));
end % end of selection loop

%% print results
% check if the user entered any shapes at all
if numberOfShapes == 0
    fprintf('No objects were entered.\n');
else
    printSummary(shape);
end

    %% print summary function
    % prints the summary of the objects
    function [] = printSummary(shape)
        % print the amount of shapes selected
        fprintf('The number of entered objects was %i.\n',length(shape));
        
        % print the top of the summary chart
        fprintf('%-8s %-18s %-18s %-18s \n',...
            'No.',...
            'ID',...
            'Colour',...
            'Area');
        
        % print the summary of the shapes
        for i = 1:length(shape)
            fprintf('%-8i %-18s %-18s %-18s \n',...
                shape(i).No,...
                shape(i).ID,...
                shape(i).colour,...
                shape(i).area);
        end
    end % end of sub function
end %end of main function