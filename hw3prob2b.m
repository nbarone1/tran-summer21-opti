% ATTEMPT HW 3 PROB 2 B
clear
close all
x0 = [2;5];
epsilon = 10^-4;
a = 0.25;
b = 0.5;
s = 2;
x=x0;
f = @(x) 100*(x(2)-x(1)^2)^2+(1-x(1))^2;
g = @(x) [400*x(1)^3-400*x(1)*x(2)+2*x(1)-2; -200*x(1)^2+200*x(2)];
% fun_val = f(x);
% grad = g(x);
% iter = 0;
% val=[];
% while(norm(grad)>epsilon)
%     iter = iter+1;
%     t = s;
%     while(fun_val-f(x-t*grad)<a*t*(norm(grad))^2)
%         t = b*t;
%     end
%     x = x-t*grad;
%     grad = g(x);
%     fun_val = f(x);
%     val(iter)=f(x);
% end
% plot(1:iter,val)
% fprintf('The answer is [%3.0f;%3.0f] and %3.0f iterations',  x, iter)


% level graphing
[x,f,iter] = backtracking(f,g,x0,epsilon)
