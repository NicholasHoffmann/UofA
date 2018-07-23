%this should teach me how matrix multiplication works
%product function

clc; clear;

A = [1,2;0,3;-2,0];
B = [0,3,-2;5,-10,0];
C = [1,2;1,-1];

product(A,B);


function value = product(A,B)

if numel(A(1,:)) ~= numel(B(:,1))
    fprintf('error, dimensions incorrect\n');
else
    value = zeros(numel(A(:,1)),numel(B(1,:)));
    for i = 1:numel(A(:,1))
        for h = 1:numel(B(1,:))
            for s = 1:numel(A(:,1))

               value(s,1) = A(s,1)*B(1,1)+A(s,2)*B(2,1);
            end
%            value(2,1) = A(2,1)*B
%            value(2,2) =
%            value(2,3) =
           
        end
    end
end


disp(value);

end