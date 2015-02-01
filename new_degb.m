function S = new_degb(M,beta,delta)
% [s,K] = es4(M,beta,delta,k);
% if(s>=1)
%     disp('The infection will spread across network even after immunization');
% else
%     disp('The infection will not spread across network after immunization');
% end;
% simulation_b = question2(K,beta,delta);
%Effect of different values of K on immunization
S = zeros(100,1);
for k1=1:100
    K = M;
    S(k1,1) = es42(K,beta,delta,k1*10);
end
% figure;
% plot(linspace(1,50),S);
% title('Effect of K on Effective strength by selecting k highest degree nodes');
% xlabel('Values of log(K)');
% ylabel('Values of Effective Strength');
end

function [s,K] = es42(K,beta,delta,k)
degree = zeros(length(K),1);
for j=1:length(K)
    degree(j) = nnz(K(j,:));
end
for i=1:k
    [m,k] = max(degree);
    K(k,:) = 0;
    K(:,k) = 0;
    degree(k,1) = 0;
end
lambda = eigs(K,1);
%lambda1 = max(lambda);
s = (lambda*beta)/delta;
end