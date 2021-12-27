function [x,fun_val,iter]=backtracking(f,g,x0,epsilon)
%x_0 is a starting point
%epsilon is the tolerance parameter
% s.....initial choice of stepsize
% alpha .....tolerance parameter for the stepsize selection 
% beta ......the constant in which the stepsize is multiplied 
%at each backtracking step (0<beta<1)
s = 2;
alpha = 0.25;
beta = 0.5;
x=x0;
iter=0;
fun_val=f(x);
grad=g(x);
v=[];
while (norm(grad)>epsilon)
    iter=iter+1;
    t=s;
    while (fun_val-f(x-t*grad)<alpha*t*norm(grad)^2)
        t=beta*t;
    end
    xt=x-t*grad;
    grad=g(xt);
    fun_val=f(xt);
    v(iter)=fun_val;
    %fprintf('iter_number=%3d norm_grad=%2.6f fun_val=%2.6f\n',iter,norm(grad),fun_val);
plot([x(1) xt(1)],[x(2) xt(2)],'b')
hold on
plot(x(1),x(2),'r.--','Markersize', 10) 
hold on
	x=xt; 
end
%%-------------------- ploting levelcurves ------------------------
x1=linspace(-2,3,100);
x2=linspace(-2,6,100);
[X1 X2]=meshgrid(x1,x2);
for i=1:100
    for j=1:100
    F(i,j)=f([X1(i,j); X2(i,j)]);
    end
end 
contour(X1,X2,F,[0, 2.^(0:10)]);
axis([-2 3 -2 6]);
xlabel('x1'); ylabel('x2');
figure
plot(1:iter,v);
xlabel('iteration'); ylabel('f(x)');
hold on