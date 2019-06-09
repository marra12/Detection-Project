
x = 0: 0.1: 12;
lambda = 4.2;
norm1 = normpdf(x,3,1);
norm2 = normpdf(x,7,1.3);

xshaded1 = lambda: 0.01 : 12;
yshaded1 = normpdf(xshaded1,3,1);
xshaded2 = lambda: 0.01 : 12;
yshaded2 = normpdf(xshaded2,7,1.3);

plot(x,norm1,'Linewidth',1.6)
hold on
plot(x,norm2,'Linewidth',1.6)
xline(lambda, 'Linestyle','--')
plot(xshaded1,yshaded1)
shade(xshaded1,yshaded1,'Fillcolor',[0.5 0.75 1])
shade(xshaded2,yshaded2,'Fillcolor', [1 0.5 0.2])
ylim([0 1])
legend('p_0(x)','p_1(x)','\lambda (threshold)')
xlabel('x')
xticks(lambda)
xticklabels('\lambda')



% H=area(x(idx),norm2(idx));
% set(H,'FaceColor',[1 0.5 0.2]);
% H1=area(x(idx),norm1(idx));
% set(H1,'FaceColor',[0.5 0.75 0.96]);
