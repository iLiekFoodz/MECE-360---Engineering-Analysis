clc; clear; close all;

% Example function (Same as lecture and AI)
f = @(x) x.^3 - 6*x.^2 + 11*x - 6;

% Search interval
xmin = 0;
xmax = 4;
N = 100; %Subintervals

% Find brackets
x = linspace(xmin,xmax,N+1);
y = f(x);

brackets = [];

for k = 1:N
    % Exact root found at grid point
    if abs(y(k)) < 1e-12
        brackets = [brackets; x(k) x(k)];
    % Sign change => bracket exists
    elseif y(k)*y(k+1) < 0
        brackets = [brackets; x(k) x(k+1)];
    end
end
% Display brackets
fprintf('Brackets found:\n');

if isempty(brackets)
    fprintf('No brackets detected.\n');
else
    disp(brackets)
end

% Ploting the function
figure;
xfine = linspace(xmin,xmax,1000);
plot(xfine,f(xfine),'LineWidth',2)
hold on, grid on
yline(0,'k--')
xlabel('x')
ylabel('f(x)')
title('Brackets - Sign Change')
% Mark brackets
for k = 1:size(brackets,1)

    a = brackets(k,1);
    b = brackets(k,2);

    xline(a,'r--','LineWidth',1.5)

    if a ~= b
        xline(b,'g--','LineWidth',1.5)
    end

end