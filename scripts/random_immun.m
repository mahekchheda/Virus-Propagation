function [s,simulation_random] = random_immun(M,beta,delta,k)
[s,K] = es1(M,beta,delta,k);
if(s>=1)
    disp('The infection will spread across network even after immunization');
else
    disp('The infection will not spread across network after immunization');
end;
% F sub-part
simulation_random = question2(K,beta,delta);

%Effect of different values of K on immunization
S = zeros(100,1);
for k1=1:100
    K = M;
    S(k1,1) = es1(K,beta,delta,k1*10);
end
figure;
plot(linspace(10,1000),S);
title('Effect of K on Effective strength using random selection of K nodes');
xlabel('Values of K');
ylabel('Values of Effective Strength');

end


function [s,K] = es1(K,beta,delta,k)
rng(0,'twister');
r = randi([1 length(K)],1,k);
%Removing randomly chosen nodes from graph
for i=1:length(r)
    K(i,:) = 0;
    K(:,i) = 0;
end
lambda = eigs(K,1);
s = (lambda*beta)/delta;
end