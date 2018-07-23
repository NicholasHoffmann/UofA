%Coding for Lab two
%question 1,a) find the projection of the vector 5,4 along the vector (-2,3).
%b) proj (4,1,-2,3) along (-1,3,-3,5)
%Recall proju V = dot(u,v)*u/dot(z,z)

clc; clear;
FractionProjection([5,4],[-2,3],'1 a)');
FractionProjection([4 1 -2 3],[-1 3 -3 5],'1 b)');

plotPerpendicularFunction(7,-4,[2,1]);
%tensionInRope(30,'degrees',19600);
%plotPerpendicularFunction((-2/7.1),(8.1/7.1),[3,9]);
rref
%This function will find the projection of the first vector onto the second
%vector and return the calculated values in an un reduced fraction
function FractionProjection(u,z,QuestionLetter)
    
    %Bottom of the fraction
    Bottom = dot(z,z);
    
    %print the question letter
    fprintf('%s = ',QuestionLetter);
    
    %a loop to find the top of each fraction and based on the size of the
    %vectors
    for i = 1:numel(z)
        %Calculate the top of the fraction
        Top = dot(u,z)*z(i);
        %Print the top and bottom of the fraction
        fprintf('%i/%i',Top,Bottom);
        %Add a comma if it isnt the last term
        if i ~= numel(z)
            fprintf(', ');
        end
    end
    
    %add space for next function
    fprintf('\n\n');
end

function plotPerpendicularFunction(slope,constant,point)

x = -abs(point(1)):abs(point(1));

%generate clear arrays for y part of functions
y = zeros(1,numel(x));
yP = zeros(1,numel(x));

% we must find b2 according to the point
% y = (-1/m)*x + b2
% b2 = y + (1/m)*x
% plug in the point

constantP = point(2) + (1/slope)*point(1);
fprintf('Equation of the line, y = %.5fx + %.5f\n',slope,constant);
fprintf('point = (%.5f,%.5f)\n',point(1),point(2));
fprintf('Equation of perpendicular line, y = %.5fx + %.5f\n',-1/slope,constantP);

%plot the functions and perpendicular function
for i = 1:numel(x)
    y(i) = slope*x(i) + constant;
    yP(i) = (1/-slope)*x(i) + constantP;
end

%plot functions
plot(x,y,'-',point(1),point(2),'.',x,yP,'--');

%set the limits to the axis
L = abs(round(point(1)))*1.5;
axis([-L, L, -L, L]);

% we must set  the equations equal mx + b = (-1/m)x + b2
% thus (m^2x + 1x)/m = b2 - b
% x(m^2 + 1)/m = b2 - b
% x = (b2 - b)*m/(m^2 + 1)
xIntersect = (constantP - constant)*slope/(slope^2 + 1);

% now we must find the y coordinate to this particular value
% since it is the intersect between the equations, we can use either
% equation
% y = mx + b
% y = m*(xIntersect) + b
yIntersect = slope*xIntersect + constant;
fprintf('Intersect Coordinates = (%.5f,%.5f)\n',xIntersect,yIntersect);

%display the arrow
fprintf('Arrow = (%.5f,%.5f)->(%.2f,%.2f)\n',xIntersect,yIntersect,point(1),point(2));
% now we must find the distance of this intersect to the point
% point - intersect
% norm ( point - intersect)
distance = norm(point - [xIntersect,yIntersect]);
fprintf('Distance = %.5f\n\n',distance);

end

function tensionInRope(angle,angletype,weight)

if angletype == 'radians'
    
tension = sin(angle)*weight;
end
if angletype == 'degrees'
tension = sind(angle)*weight;
end
fprintf('tension = %.5f\n\n',tension);

end


