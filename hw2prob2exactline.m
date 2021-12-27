% minimize xTAx, x c R^5
% A = 5x5 Hilbert matrix
% initial vector x0 = (1,2,3,4,5)
% code for exact line, constant stepsize, backtracking
%       constant step size t = 0.1
%       back tracking parameters a = 0.5, b = 0.5, s = 1
% norm of gradient of f(x) <= 10^-4
A = hilb(5);
x0 = [1;2;3;4;5];
t = 0.1;
epsilon = 10^-2;
iter=0;
grad = 2*(A*x0);
norm(grad)
x=x0;
while(norm(grad)>epsilon)
%while (iter < 10)
   iter = iter+1;
   t = (norm(grad)^2)/(2*(grad'*A*grad));
   x = x-t*grad;
   grad = 2*(A*x);
   fun_val = x'*A*x;
   fprintf('iter_number = %3d norm_grad = %2.6f fun_val = %2.6f\n',iter,norm(grad),fun_val)
   plot(iter,norm(grad),'r.--')
   title('Exact Line Search')
   hold on
end
% 45 steps w norm(grad) = 0.009248
% x = [0.525;-0.0151;-0.4217;-0.1094;0.6143]
% fun_val = 0.001829
% grad = [-0.0003;-0.0074;-0.0022;0.0019;0.0046]