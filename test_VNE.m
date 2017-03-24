% Test the VNE calculation on the diffusion limited aggregation tree
% branching data.

%% Generate the data

n_dim = 100;
n_branch = 20;
n_steps = 100;
n_drop=0;
seed = 37;
rng(seed); % <---------------- CONSTANT RANDOMNESS SEED FOR REPRODUCABILITY


%% generate random fractal tree via DLA
M = cumsum(-1 + 2*(rand(n_steps,n_dim)),1);
for I=1:n_branch-1
    ind = randsample(size(M,1), 1);
    M2 = cumsum(-1 + 2*(rand(n_steps,n_dim)),1);
    M = [M; repmat(M(ind,:),n_steps,1) + M2];
end
C = repmat(1:n_branch,n_steps,1);
C = C(:);
fprintf(1,'%u data points by %u features\n',size(M,1),size(M,2));

%% add noise
sigma = 4;
M = M + normrnd(0, sigma, size(M,1), size(M,2));

%% Calculate and plot VNE


t_vec=1:150;
k=5;
a=13;
pca_method='none';
log_transform=0;

% Choose a t value in the flatter range after the knee
[H, t_vec] = VNE(M,'t_vec',t_vec,'k',k,'a',a,'pca_method',pca_method,'log',log_transform);



