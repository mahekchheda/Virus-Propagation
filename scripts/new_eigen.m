function [s,simulation_eigen] = new_eigen(M,beta,delta,k)
[s,K] = es3(M,beta,delta,k);
if(s>=1)
    disp('The infection will spread across network even after immunization');
else
    disp('The infection will not spread across network after immunization');
end;
%simulation_eigen = K;
simulation_eigen = question2(K,beta,delta);

% E sub-part
%Effect of different values of K on immunization
S = zeros(100,1);
for k1=1:100
    K = M;
    S(k1,1) = es3(K,beta,delta,k1*10);
end
figure;
plot(linspace(10,1000),S);
title('Effect of K on Effective strength by selecting k highest nodes in Eigenvector');
xlabel('Values of K');
ylabel('Values of Effective Strength');
end

function [s,K] = es3(K,beta,delta,k1)
[high,D] = eigs(K,1);
high = abs(high);
%high = V(floor(ind/length(D)),:);
for i=1:k1
    [m,j] = max(high);
    K(j,:) = 0;
    K(:,j) = 0;
    high(j) = 0;
end
lambda = eigs(K,1);
%lambda1 = max(lambda);
s = (lambda*beta)/delta;
end