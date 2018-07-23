%{
created by Nicholas Hoffmann

function that returns data based on an equation of a linear line and a
chosen point.
%}

function [] = lineToPoint(slope,constant,pointX,pointY,version)

% we must find b2 according to the point
% y = (-1/m)*x + b2
% b2 = y + (1/m)*x
% plug in the point

constantP = pointY + (1/slope)*pointX;
fprintf('Equation of the line, y = %.5fx + %.5f\n',slope,constant);
fprintf('point = (%.5f,%.5f)\n',pointX,pointY);
fprintf('Equation of perpendicular line, y = %.5fx + %.5f\n',-1/slope,constantP);


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
fprintf('Arrow = (%.5f,%.5f)->(%.2f,%.2f)\n',xIntersect,yIntersect,pointX,pointY);
% now we must find the distance of this intersect to the point
% point - intersect
% norm ( point - intersect)
distance = norm([pointX,pointY] - [xIntersect,yIntersect]);
fprintf('Distance = %.5f\n\n',distance);

if exist('version','var')
    if isequal(version,'plot')
        x = linspace(-abs(pointX),abs(pointX),20);
        y = x*slope+constant;
        yP = x*(1/-slope)+constantP;
        
        plot(x,y,'-',pointX,pointY,'*',x,yP,'--');
        
        %figure out the best bounds for the axis.
        if pointX >= pointY
            L = abs(ceil(pointX))*1.5;
        else
            L = abs(ceil(pointY))*1.5;
        end
        
        axis([-L, L, -L, L]);
    else
        fprintf('The selected extra function does not exist.\n');
    end
    
end

end