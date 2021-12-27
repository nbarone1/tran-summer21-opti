x0=[5;10];
iter=0;
A = [1,1/2;1/2,1];
B = [1;-1];
a = 0.5;
b = 0.5;
s = 1;
epsilon = 10^-4;
grad = 2*(A*x0)+b;
norm(grad)
x=x0;
f = @(x) x'*A*x+B'*x;
fun_val = f(x);
while(norm(grad)>epsilon)
% while (iter < 10)
   iter = iter+1
   t = s;
   while (fun_val-f(x-t*grad)<a*t*norm(grad)^2)
       t = b*t;
   end
   x = x-t*grad
   grad = 2*(A*x)+B
   norm(grad)
   fun_val = x'*A*x+B'*x;
   fprintf('iter_number = %3d norm_grad = %2.6f fun_val = %2.6f\n',iter,norm(grad),fun_val)
   plot(iter,norm(grad),'r.--')
   title('Back Tracing')
   hold on
 end
% 17 streps norm(grad) = 0.000051
% x = [-1.0000;1.0000]
% grad = [-0.1001;0.5007]
% fun_val = -1.000000