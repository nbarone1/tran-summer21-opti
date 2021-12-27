x0=[5;10];
iter=0;
A = [1,1/2;1/2,1];
b = [1;-1];
epsilon = 10^-4;
grad = 2*(A*x0)+b;
norm(grad)
x=x0;
 while(norm(grad)>epsilon)
%while (iter < 10)
   iter = iter+1;
   t = 0.1;
   x = x-t*grad;
   grad = 2*(A*x)+b;
   norm(grad);
   fun_val = x'*A*x+b'*x;
   fprintf('iter_number = %3d norm_grad = %2.6f fun_val = %2.6f\n',iter,norm(grad),fun_val)
   plot(iter,norm(grad),'r.--')
   title('Constant Step')
   hold on
 end
% Solved with 95 steps w norm(grad) = 0.000095
% x = [-1.001;1.001]
% grad = 10^-4 * [-0.6747;0.6747]
% fun-val = -1.000000