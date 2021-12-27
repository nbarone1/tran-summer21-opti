% minimize xTAx, x c R^5
% A = 5x5 Hilbert matrix
% initial vector x0 = (1,2,3,4,5)
% code for exact line, constant stepsize, backtracking
%       constant step size t = 0.1
%       back tracking parameters a = 0.5, b = 0.5, s = 1
% norm of gradient of f(x) <= 10^-2
A = hilb(5);
x0 = [1;2;3;4;5];
t = 0.1;
epsilon = 10^-2;
iter=0;
grad = 2*(A*x0);
a = 0.5;
b = 0.5;
s = 1;
norm(grad)
x=x0;
f = @(x) x'*A*x;
fun_val = f(x);
while(norm(grad)>epsilon)
%while (iter < 10)
   iter = iter+1
   t = s;
   while (fun_val-f(x-t*grad)<a*t*norm(grad)^2)
       t = b*t;
   end
   x = x-t*grad
   grad = 2*(A*x)
   norm(grad)
   fun_val = f(x);
   fprintf('iter_number = %3d norm_grad = %2.6f fun_val = %2.6f\n',iter,norm(grad),fun_val)
   plot(iter,norm(grad),'r.--')
   title('Back Tracing')
   hold on
 end
% Solved with 116 iterations w norm(grad) = 0.008794
% x = [0.0502;-0.0024;-0.4181;-0.1140;0.6040]
% grad = [0.0037;-0.0048;-0.0005;0.0032;0.0055]
% fun_val = 0.001679