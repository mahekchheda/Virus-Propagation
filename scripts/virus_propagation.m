function M = virus_propagation(inp)
fid = fopen(inp,'rb');
% Read the graph file and convert the adjacency list to matrix form.
N = fscanf(fid, '%d %d\n', [1,2]);
M = zeros(N(1),N(1));
for x=1:N(2)
    X = fscanf(fid,'%d %d\n',[1,2]);
    % Adding 1 because MATLAB does not support 0 as index vertex so we add
    % 1 here and subtract 1 as it has no consequence on the output or
    % functioning.
    M(X(1)+1,X(2)+1) = 1;
    M(X(2)+1,X(1)+1) = 1;
end
beta1 = 0.2;
beta2 = 0.01;
delta1 = 0.7;
delta2 = 0.6;
k1 = 200;

% Question 1
[b1,d1] = question1(M,beta1,delta1)
[b2,d2] = question1(M,beta2,delta2)

%Question 2
infected = question2(M,beta1,delta1)
uninfected = question2(M,beta2,delta2)

%Question 3
[s_policya,simulation_policya] = random_immun(M,beta1,delta1,k1)
[s_policyb,simulation_policyb] = highest_degb(M,beta1.delta1,k1)
[s_policyc,simulation_policyc] = highest_deg(M,beta1,delta1,k1)
[s_policyd,simulation_policyd] = new_eigen(M,beta1,delta1,k1)
fclose(fid);
end