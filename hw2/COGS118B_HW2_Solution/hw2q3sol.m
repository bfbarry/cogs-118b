%% PROBLEM 3 %%

% Author: Haotian Zhu
% slightly modified by Shuai Tang

clc;clear;close all;

% Part 1 %
figure;
% initializing initial hyperparameters a b as a matrix
ab = [1,1;0.5,0.5;50,50];
% plotting the initial prior at the first spot
sp_idx = [3,2,1];
% creating tally variable to count # of heads and tails
tally = [0,0];
% calling the function plotbetapdfs to make the first subplot
plotbetapdfs(ab,sp_idx,tally(1,:));

% simulating coinflip using function mnrnd with # of flips 1 and
% specified probability distribution p=(0.25,0.75)
p = [0.25,0.75];
N = 5;
tally = zeros(N,2);
% filling the tally matrix
tally(1,:) = mnrnd(1,p);
for i = 2:5
    tally(i,:) = mnrnd(1,p)+tally(i-1,:); 
end

% updating the hyperparameters a,b according to coinflip result
% this update is made according to the rule derived in Bishop page 72
% increase a by m, # of heads and b by l, # of tails
for i=2:6
    sp_idx = [3,2,i];
    plotbetapdfs(ab+[tally(i-1,:);tally(i-1,:);tally(i-1,:)],sp_idx,tally(i-1,:));
end


% Part 2 %
% in this part, we are to simulate the coinflip 2048 times, among which
% the times with 2^i will be recorded, i=1,...,11
figure;
% initializing initial hyperparameters a b as a matrix
ab = [1,1;0.5,0.5;50,50];
% plotting the initial prior at the first spot
sp_idx = [4,3,1];
% creating tally variable to count # of heads and tails
tally = [0,0];
% calling the function plotbetapdfs to make the first subplot
plotbetapdfs(ab,sp_idx,tally(1,:));

% simulating coinflip using function mnrnd with specified probability 
% distribution p=(0.25,0.75)
p = [0.25,0.75];
N = 11;
tally = zeros(N,2);
% filling the tally matrix by incrementing each row on the previous one
tally(1,:) = mnrnd(2^1,p);

for i = 2:11
    tally(i,:) = mnrnd((2^i-2^(i-1)),p)+tally(i-1,:); 
end

for i=2:12
    sp_idx = [4,3,i];
    plotbetapdfs(ab+[tally(i-1,:);tally(i-1,:);tally(i-1,:)],sp_idx,tally(i-1,:));
end


% Part 3 %

% During first 5 flips, the posterior distribution with the Beta(a=50,
% b=50) doesn’t change much, while the posterior distribution with each
% of the other 2 priors varies a lot. We can think of the prior - Beta
% distribution in Bayesian estimation as adding fake data into our
% experiment. In our case, a Beta(a=50,b=50) as the prior is equivalent
% to adding 100 "fake" flips, in which 50 of them are heads, and with
% this prior, 5 "real" flips don't have a strong impact on the posterior
% probability. Compared with Beta(a=50,b=50), Beta(a=1,b=1) is similar
% to adding 2 "fake" flips, and one of them is head, thus during 5
% flips, we observed that the posterior distribution varies a lot since
% the "real" flips gradually takes control of the posterior.

% Part 4 %

% As we think of the Beta prior as adding "fake" flips into our "real
% experiments, when there is a large amount of data, unless we have a
% strong prior belief of what the parameters should be, the "real" data
% becomes more dominant in determining the posterior distribution, and
% potentially overwrites the impact from the prior. After thousands of
% flips, the posterior distributions with 3 different priors get closer
% and more similar to each other.



