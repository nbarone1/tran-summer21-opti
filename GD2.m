%Gradient Descentwith backtracing to solve
%f(x)=1/(2m)||X*w-y||^2
%val = vector storing function at each iteration N
%gradient of function is grad=1/m*X'(X*w-y)
% t on input is s
function [val,w,iter] = GD2(X,y)
d = size(X,2);
m = size(X,1);
w = zeros(d,1);
a = 0.5;
b = 0.5;
s =1;
epsilon = 1e-2;
f = @(w) 1/(2*m)*norm(X*w-y)^2;
g = @(w) 1/m*X'*(X*w-y);
iter=0;
fun_val = f(w);
grad = g(w);
val=[];
while (norm(grad)>epsilon)
    iter=iter+1;
    t = s;
    while (fun_val - f(w-t*grad) < a*t*(norm(grad)^2))
        t=b*t;
    end
    w = w-t*grad;
    grad = g(w)
    val(iter)=f(w);
end
end