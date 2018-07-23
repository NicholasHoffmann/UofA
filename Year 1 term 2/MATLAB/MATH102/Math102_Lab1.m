clc;
clear;

%Question one
a = 5^4/3^5-2.45*1.86;
b = sqrt(1/3.24);					
c = 2*[3,1,-2]-(3^3/4)*[3.2,1.4,-1.5];			
d = dot([1,-2,4/3],[-1.5,-5/3,4]);			
e = cos(pi/3);
f = atan(0.6);
g = 1.5*[2.1,-3.2,2.6] - 0.7*[3.3,-4.1,-2.7]; 

fprintf('1a) ='); disp(a);
fprintf('1b) ='); disp(b);
fprintf('1c) ='); fprintf('%1.3f%',c);
fprintf('1d) ='); disp(d);
fprintf('1e) ='); disp(e);
fprintf('1f) ='); disp(f);
fprintf('1g) ='); disp(g);

%end of Quesition one
clear;

%Question Two
VectorInformation([2,-3],[2,1],'a)');
VectorInformation([4,-3,-2],[3/2,0,2],'b)');
VectorInformation([1.43,2.25,-1.73],[2.84,-0.66,2.11],'c)');

%end of question two
clear;

%Question Three

%The equation of the plane
equation = [2,-4,3];

%display equation
fprintf('3)\n');
fprintf('equation = (%i,%i,%i)\n\n',equation(1),equation(2),equation(3));

%find vectort that are one this plane
findVectors(equation);

%check if the vectors are parallel
checkIfParallel(equation,0,[3,1,2]);
checkIfParallel(equation,0,[-6,3,8]);

%Question Four
SolveEquation([2,-1],[4,5],[3,1],[-1,1],'4a)');
SolveEquation([1,3,2],[3,4,0],[-2,1,1],[4,0,-3],'4b)');
SolveEquation([3,4,0],[1,2,4],[-2,1,2],[1,4,0],'4c)');

%end of Lab 1
clear;

%Function for qeustion two, u and v are the vectors
function VectorInformation(u,v,QuestionLetter)
    
    %print the question letter
    fprintf('2');
    fprintf(QuestionLetter);
    
    %The length of the vector is equal to the square root of the dot product of
    %itself
    
    %Length of u
    fprintf('\nLength of u = %.4f\n',sqrt(dot(u,u)));
    
    %Length of v
    fprintf('Length of v = %.4f\n',sqrt(dot(v,v)));
    
    %this is the angle between the vectors
    fprintf('Angle = %.4f radians\n\n',acos(dot(u,v)/((norm(u)*norm(v)))));
    clear;
end

%This function will find vectors on the plane given a
function findVectors(a)

    equation = a;
    
    %generate two simple vectors
    vOne = [0,1,0];
    vTwo = [1,0,0];
    
    %if we take the dot product, there is a constant left over in which we
    %solve
    constant = dot(vOne(1:2),equation(1:2));
    %solve for variable
    vOne(1,3) = (-1)*constant/equation(1,3);
    %print Solved Vector
    fprintf('Vector 1 = %4.4f %4.4f %4.4f \n\n', vOne(1), vOne(2), vOne(3));

    %repeat top step
    constant = dot(vTwo(1:2),equation(1:2));
    vTwo(1,3) = (-1)*constant/equation(1,3);
    fprintf('Vector 2 = %4.4f %4.4f %4.4f \n\n', vTwo(1), vTwo(2), vTwo(3))
    
    %the perpendicular vector
    fprintf('Perpendicular Vector = %4.4f %4.4f %4.4f \n\n', equation(1), equation(2), equation(3))
    
    clear;
end

%This function will check if a given vector is parallel to a plane
function checkIfParallel(a,b,av)
    
    equation = a;
    vector = av;
    
    %if the dot product of the two variables is equal to value given b,
    %they are considered parallel
    if dot(equation,vector) == b
        statement = '';
    else
        statement = 'not';
    end
    
    %print the coordinates of the vectors
    fprintf('Vector (%i,%i,%i) is %s parallel to ',vector(1),vector(2),vector(3),statement);
    
    %print the equation
    fprintf('(%i,%i,%i)\n\n',equation(1),equation(2),equation(3));
    
    clear;
end

%This solve basic equations through brute force of trying integer values
function SolveEquation(ConstantOne,ConstantTwo,ScalarOne,ScalarTwo,QuestionLetter)

    %a varaible to store whether or not values have been found
    FoundValues = 0; 
    
    %loop integer values between -100 and 100
    for s = -100:100            
        for u = -100:100                    
         
            xt = ConstantOne + s*ScalarOne;  
            xs = ConstantTwo + u*ScalarTwo;
            %Check if they are equal
            if xt == xs                     
                %Display all found values (if one is found)
                disp(QuestionLetter);       
                fprintf('x1 =  %i\n',s);
                fprintf('x2 = %i\n',u);
                fprintf('coordinates = (');
                
                %Display coordinates
                for h = 1:numel(xs)         
                    fprintf('%i',xs(h));
                    if h ~= numel(xs)                        
                        %add comma after value excluding last number                      
                        fprintf(',');                    
                    end                     
                end
                %new space
                fprintf(')\n\n');           
                FoundValues = 1;                
            end
        end
        %value has been found, stop loop
        if FoundValues == 1                 
            break
        end
    end
        %if no value has been found
        if FoundValues == 0                 
            disp(QuestionLetter);
            disp('No values found');
        end
        clear;
end



