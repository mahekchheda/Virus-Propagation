function [b,d] = question1(M,beta,delta)
lambda = eig(M);
lambda1 = max(lambda);
s = (lambda1*beta)/delta;
if(s>=1)
    disp('The infection will spread across network');
else
    disp('The infection will not spread across network');
end;
%Calculating the value of beta with delta constant
s_beta = zeros(100,1);
b = zeros(100,1);
for i=1:100
    b(i,1) = i/100;
    s_beta(i,1) = (lambda1*b(i,1))/(delta);
end
%%Min beta value that will lead to epidemic.
min_beta = delta/(lambda1)

%Calculating the value of delta with beta constant
s_delta = zeros(100,1);
d = zeros(100,1);
for i=1:100
    d(i,1) = i/100;
    s_delta(i,1) = (lambda1*beta)/(d(i,1));
end
min_delta = beta*lambda1
if(min_delta>1)
    disp('This infection will spread irrespective of healing factor as value of min_delta is beyond 1');
end
figure % new figure
ax1 = subplot(2,1,1); % top subplot
ax2 = subplot(2,1,2); % bottom subplot
plot(ax1,b,s_beta);
title(ax1,'Effect of Beta on effective strength');
xlabel(ax1,'Beta');
ylabel(ax1,'Effective strength');
plot(ax2,d,s_delta);
title(ax2,'Effect of Delta on effective strength');
xlabel(ax2,'Delta');
ylabel(ax2,'Effective strength');
end