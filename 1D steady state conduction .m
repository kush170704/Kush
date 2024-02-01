% 1D steady state conduction
% Input parameter
L = 100; %(m)
N = 6; % Number of nodes
dx = L/(N-1); %distance between consecutive nodes
tol = 1e-4;

% Domain discretization
T_new = zeros(N,1); %Initialising the domain

x = linspace(0,L,N);

%BC
for i=1:N
    T_new(1,1)=100;
end

%Main Loop - Logic
error = 1;iter = 0;
while(error>tol)
    iter = iter + 1;
    T = T_new;
    for i = 2:N-1
        T_new(i) = (T(i+1)+T(i-1))/2;
    end
    error = max(max(abs(T-T_new)));
    figure(2);

    %plotting
    plot(T_new); shading flat; colorbar;
    xlabel('Position');
    ylabel('Temperature (C)');
    title('Temperature profile in 1D steady state heat conduction');
    grid on;
end


