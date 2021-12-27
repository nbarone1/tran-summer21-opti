%Gradient Descentwith contant step to solve
%f(x)=1/(2m)||X*w-y||^2
%val = vector storing function at each iteration N
%gradient of function is grad=1/m*X'(X*w-y)
function [val,w] = GD(X,y,t,N)
d=size(X,2);
m=size(X,1);
w = zeros(d,1);
val=[];
for i=1:N
    grad=1/m*X'*(X*w-y);
    w=w-t*grad;
    val(i)=1/(2*m)*norm(X*w-y);
end
end
