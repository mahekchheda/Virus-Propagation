function Mean = question2(M,beta,delta)
fraction_infected = zeros(10,100);
rng(0,'twister');
for i=1:10
    state_node = zeros(length(M),1);
    for j=1:100
        if (j==1)
            r = randi([1 length(M)],1,floor(length(M)/10));
            for l=1:length(r)
                state_node(r,1) = 1;
            end
        else
            for k=1:length(M)
                if(state_node(k,1)==0)
                    ind = find(M(k,:));
                    %bool = false;
                    for m=1:length(ind)
                        if(state_node(ind(m),1) && rand()<=beta)
                            %bool = true;
                            state_node(k,1) = 1;
                        end
                    %end
                    %if(bool && rand()<=beta)
                        %state_node(k,1) = 1;
                    end
                else
                    ind = find(M(k,:));
                    for m=1:length(ind)
                        if(rand()<=beta)
                            state_node(m,1) = 1;
                        end
                    end
                    if(rand()<=delta)
                        state_node(k,1) = 0;
                    end
                end
            end
        end
        fraction_infected(i,j) = nnz(state_node)/length(M);
    end
end
Mean = mean(fraction_infected);
figure;
plot(linspace(1,100),Mean);
title('Plot of the average (over the 10 simulations) fraction of infected nodes at each time step');
xlabel('Timestep');
ylabel('Average of infected nodes from 0 to 1');
end