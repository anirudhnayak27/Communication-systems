% Define a range of input values (x)
x = linspace(0, 1, 1000);

% Set A and u values (initially different for comparison)
A = 255;  % A-law parameter
u = 255;   % u-law parameter

% Calculate companding gains for A-law and u-law
gain_A = (1 + A) ./ (1 + A * abs(x));
gain_u = (1 + u * abs(x)) ./ (1 + u);

% Plot the gains to visualize
plot(x, gain_A, 'b-', x, gain_u, 'r--');
legend('A-law Gain', 'u-law Gain');
xlabel('Input Value (x)');
ylabel('Companding Gain');
title('Companding Gain Comparison');

% Check for equality (will initially show difference)
disp(['Gains equal? ', num2str(isequal(gain_A, gain_u))])

% Now set A = u and repeat the comparison
A = u;
gain_A = (1 + A) ./ (1 + A * abs(x));
disp(['Gains equal? ', num2str(isequal(gain_A, gain_u))])
