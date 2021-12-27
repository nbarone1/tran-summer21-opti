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
   iter = iter+1
   t = (norm(grad)^2)/(2*(grad'*A*grad));
   x = x-t*grad
   grad = 2*(A*x)+b
   fun_val = x'*A*x+b'*x;
   fprintf('iter_number = %3d norm_grad = %2.6f fun_val = %2.6f\n',iter,norm(grad),fun_val)
   plot(iter,norm(grad),'r.--')
   title('Exact Line Search')
   hold on
end
% solved 5 steps w norm(grad) = 0.000048
% x = [-1.0000;1.0000]
% grad = [-0.3632;0.3178]
% fun_val = -1.000000