clear

addpath('Algs')
addpath('Funcs')
addpath('Utilities')

setup = 'sim3-6';

T = 10e3;               % Time horizon
Num_Trials = 100; 
Num_exp = 12;   %round(log(T))

switch setup
%% One dim problem
    case 'sim1-1'
AvgThruput{1} = [0.1:0.1:0.9 0.8:-0.1:0.1];    %K=17
AvgThruput{2} = [0.1:0.04:0.9 0.86:-0.04:0.1];    %K=41
AvgThruput{3} = [0.1:0.02:0.9 0.88:-0.02:0.1];    %K=81
AvgThruput{4} = [0.1:0.016:0.9 0.884:-0.016:0.1];    %K=101
AvgThruput{5} = [0.1:0.0125:0.9 0.8875:-0.0125:0.1];  %K=129
%% One dim problem 2 (repeat suboptimal)
    case 'sim1-2'
AvgThruput{1} = [0.1:0.1:0.9 0.8:-0.1:0.1];    %K=17
AvgThruput{2} = repelem(AvgThruput{1},2);    %K=33
temp=find(AvgThruput{2}==0.9); temp(1)=[];
AvgThruput{2}(temp) =[]; 
AvgThruput{3} = repelem(AvgThruput{2},2);    %K=65
temp=find(AvgThruput{3}==0.9); temp(1)=[];
AvgThruput{3}(temp) =[]; 
AvgThruput{4} = repelem(AvgThruput{2},3);    %K=97
temp=find(AvgThruput{4}==0.9); temp(1)=[];
AvgThruput{4}(temp) =[]; 
AvgThruput{5} = repelem(AvgThruput{2},4);    %K=129
temp=find(AvgThruput{5}==0.9); temp(1)=[];
AvgThruput{5}(temp) =[]; clear temp

%% One dim problem 2 (repeat suboptimal except neighbors of optimal)
    case 'sim1-3'
AvgThruput{1} = [0.1:0.1:0.9 0.8:-0.1:0.1];    %K=17
thetatemp = [0.1:0.1:0.7 0.7:-0.1:0.1];
AvgThruput{2} = repelem(thetatemp,2);  k=length(AvgThruput{2})/2;  %K=31
AvgThruput{2} = [AvgThruput{2}(1:k) 0.8 0.9 0.8 AvgThruput{2}(k+1:k*2)];
AvgThruput{3} = repelem(thetatemp,4);  k=length(AvgThruput{3})/2;    %K=59
AvgThruput{3} = [AvgThruput{3}(1:k) 0.8 0.9 0.8 AvgThruput{3}(k+1:k*2)];
AvgThruput{4} = repelem(thetatemp,6);  k=length(AvgThruput{4})/2;    %K=87
AvgThruput{4} = [AvgThruput{4}(1:k) 0.8 0.9 0.8 AvgThruput{4}(k+1:k*2)];
AvgThruput{5} = repelem(thetatemp,8);  k=length(AvgThruput{5})/2;    %K=115
AvgThruput{5} = [AvgThruput{5}(1:k) 0.8 0.9 0.8 AvgThruput{5}(k+1:k*2)];
    
%% 2-dim problem increase #rates
    case 'sim2-1'
% i=3, k=9
Rate{1} = [3 5 6]; 
PredProb{1} = [0.3 0.5 0.65];
TranProbr{1} = [0.9 0.85 0.15];
Beam{1} = [1 2 3 4 5 6 7 8 9];
TranProbb{1} = [0.1:0.2:0.9 0.7:-0.2:0.1];
AvgThruput{1} = (PredProb{1}.*TranProbr{1})'.*TranProbb{1};

% i=5, k=9
Rate{2} = [2 3 5 6 9]; 
PredProb{2} = [0.1 0.3 0.5 0.65 0.9];
TranProbr{2} = [0.99 0.6 0.4 0.2 0.05];
Beam{2} = [1 2 3 4 5 6 7 8 9];
TranProbb{2} = [0.1:0.2:0.9 0.7:-0.2:0.1];
AvgThruput{2} = (PredProb{2}.*TranProbr{2})'.*TranProbb{2};

% i=8, k=9
Rate{3} = [2 3 4 5 6 7 8 9]; 
PredProb{3} = [0.1 0.3 0.4 0.5 0.65 0.73 0.8 0.9];
TranProbr{3} = [0.99 0.8 0.6 0.4 0.2 0.15 0.1 0.05];
Beam{3} = [1 2 3 4 5 6 7 8 9];
TranProbb{3} = [0.1:0.2:0.9 0.7:-0.2:0.1];
AvgThruput{3} = (PredProb{3}.*TranProbr{3})'.*TranProbb{3};

% i=10, k=9
Rate{4} = [2 3 4 5 6 7 8 9 10 11]; 
PredProb{4} = [0.1 0.3 0.4 0.5 0.65 0.73 0.8 0.9 0.95 0.99];
TranProbr{4} = [0.99 0.8 0.6 0.4 0.2 0.15 0.1 0.05 0.03 0.01];
Beam{4} = [1 2 3 4 5 6 7 8 9];
TranProbb{4} = [0.1:0.2:0.9 0.7:-0.2:0.1];
AvgThruput{4} = (PredProb{4}.*TranProbr{4})'.*TranProbb{4};
    
%% 2-dim problem increase #beams
    case 'sim2-2'
% i=5, k=5
Rate{1} = [2 3 5 6 9]; 
PredProb{1} = [0.1 0.3 0.5 0.65 0.9];
TranProbr{1} = [0.99 0.6 0.4 0.2 0.05];
Beam{1} = [1 2 3 4 5];
TranProbb{1} = [0.1:0.4:0.9 0.5:-0.4:0.1];
AvgThruput{1} = (PredProb{1}.*TranProbr{1})'.*TranProbb{1};

% i=5, k=9
Rate{2} = [2 3 5 6 9]; 
PredProb{2} = [0.1 0.3 0.5 0.65 0.9];
TranProbr{2} = [0.99 0.6 0.4 0.2 0.05];
Beam{2} = [1 2 3 4 5 6 7 8 9];
TranProbb{2} = [0.1:0.2:0.9 0.7:-0.2:0.1];
AvgThruput{2} = (PredProb{2}.*TranProbr{2})'.*TranProbb{2};

% i=5, k=11
Rate{3} = [2 3 5 6 9]; 
PredProb{3} = [0.1 0.3 0.5 0.65 0.9];
TranProbr{3} = [0.99 0.6 0.4 0.2 0.05];
Beam{3} = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17];
TranProbb{3} = [0.1:0.16:0.9 0.8:-0.16:0.1];
AvgThruput{3} = (PredProb{3}.*TranProbr{3})'.*TranProbb{3};

% i=5, k=17
Rate{4} = [2 3 5 6 9]; 
PredProb{4} = [0.1 0.3 0.5 0.65 0.9];
TranProbr{4} = [0.99 0.6 0.4 0.2 0.05];
Beam{4} = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17];
TranProbb{4} = [0.1:0.1:0.9 0.85:-0.1:0.1];
AvgThruput{4} = (PredProb{4}.*TranProbr{4})'.*TranProbb{4};

case 'sim3-6'

   % 6th setup (trans prob peaks at opt beam)
    Rate = [2 3 5 6 8]; 

    PredProb = [0.01 0.08 0.8 0.88 0.95];
    TranProbr = [0.99 0.9 0.85 0.15 0.05];

    Beam = [1 2 3 4 5 6 7 8 9];
    TranProbb = [0.01 0.05 0.15 0.3 0.9 0.3 0.15 0.05 0.01];

    AvgThruput = (PredProb.*TranProbr)'.*TranProbb;

case 'sim3-4'
   % 4th setup (vertically not unimodal)
    Rate = [2 3 5 6 8]; 

    PredProb = [0.15 0.3 0.45 0.6 0.75];
    TranProbr = [0.99 0.8 0.5 0.38 0.2];

    Beam = [1 2 3 4 5 6 7 8 9];
    TranProbb = [0.1:0.2:0.9 0.7:-0.2:0.1];

    AvgThruput = (PredProb.*TranProbr)'.*TranProbb;
    
case 'sim3-3'
    % 3rd setup (w/ beam selection)
    Rate = [2 3 5 6 9]; 

    PredProb = [0.01 0.08 0.8 0.88 0.95];
    TranProbr = [0.99 0.9 0.85 0.15 0.05];

    Beam = [1 2 3 4 5 6 7 8 9];
    TranProbb = [0.1:0.2:0.9 0.7:-0.2:0.1];

    AvgThruput = (PredProb.*TranProbr)'.*TranProbb;
        
end

%AvgThruput = normpdf(-2:0.05:4, 1, 1)*2;     %K=121, normal dist.

KL_fixregret = cell(Num_exp,1);   UCB_fixregret = cell(Num_exp,1);
TS_fixregret = cell(Num_exp,1);
NumArms = [];

KL_regret = cell(Num_exp,1);   UCB_regret = cell(Num_exp,1);
TS_regret = cell(Num_exp,1);


%KL_SelectedArms  = cell(Num_exp,1);   UCB_SelectedArms  = cell(Num_exp,1);
%TS_SelectedArms  = cell(Num_exp,1);
 
    
%%
for e=1:Num_exp

disp("e")
disp(e)
    
%Env = AvgThruput{e};

KL_SelectedArms       = [];   UCB_SelectedArms       = [];
TS_SelectedArms       = [];

KL_timer = [];        TS_timer = [];   
UCB_timer = [];  


%% Run Algorithms for Num_Trials Times
    for trial = 1:Num_Trials
        disp(trial)

        %% 1-dim OSUB
        %[~, KL_reg, KL_areg, KL_Arm, timer1] = OSUB(AvgThruput{e}, 2, T, "KLUCB");  
        %[~, UCB_reg, UCB_areg, UCB_Arm, timer2] = OSUB(AvgThruput{e}, 2, T, "UCB");
        %[~, TS_reg, TS_areg, TS_Arm, timer3] = OSUB(AvgThruput{e}, 2, T, "TS");

        %% 1-dim Classic algs
        %[~, KL_reg, KL_areg, KL_Arm, timer1] = Classic(AvgThruput{e}, T, "KLUCB");  
        %[~, UCB_reg, UCB_areg, UCB_Arm, timer2] = Classic(AvgThruput{e}, T, "UCB");
        %[~, TS_reg, TS_areg, TS_Arm, timer3] = Classic(AvgThruput{e}, T, "TS");

        %% 2-dim OSUB
        %[~, TS_reg, TS_areg, TS_Arm, timer1] = OSUB_TwoDim(PredProb{e}, TranProbr{e}, TranProbb{e}, 4, T, "TS");
        %[~, KL_reg, KL_areg, KL_Arm, timer2] = OSUB_TwoDim(PredProb{e}, TranProbr{e}, TranProbb{e}, 4, T, "KLUCB");  
        %[~, UCB_reg, UCB_areg, UCB_Arm, timer3] = OSUB_TwoDim(PredProb{e}, TranProbr{e}, TranProbb{e}, 4, T, "UCB");
        
        %% OSUB alt
        [TS_X, TS_reg, TS_areg, TS_Arm, timer1] = OSUB_two_phase(PredProb, TranProbr, TranProbb, 2, T, "TS", e);
        [KL_X, KL_reg, KL_areg, KL_Arm, timer2] = OSUB_two_phase(PredProb, TranProbr, TranProbb, 2, T, "KLUCB", e);  
        [UCB_X, UCB_reg, UCB_areg, UCB_Arm, timer3] = OSUB_two_phase(PredProb, TranProbr, TranProbb, 2, T, "UCB", e);
    
        %% 2-dim Classic
        %[~, TS_regret, ~, U_TS_Arm, timer1] = Classic_2dim(PredProb{e}, TranProbr{e}, TranProbb{e}, T, "TS");
        %[~, KL_regret, ~, U_KL_Arm, timer2] = Classic_2dim(PredProb{e}, TranProbr{e}, TranProbb{e}, T, "KLUCB");  
        %[~, UCB_regret, ~, U_UCB_Arm, timer3] = Classic_2dim(PredProb{e}, TranProbr{e}, TranProbb{e}, T, "UCB");
        
        %% Update records
        KL_SelectedArms       = [KL_SelectedArms; KL_Arm];
        UCB_SelectedArms       = [UCB_SelectedArms; UCB_Arm];
        TS_SelectedArms       = [TS_SelectedArms; TS_Arm];

        %KL_reward       = [KL_reward; KL_X];
        %UCB_reward       = [UCB_reward; UCB_X];
        %TS_reward       = [TS_reward; TS_X];

        KL_regret       = [KL_regret; KL_reg];
        UCB_regret       = [UCB_regret; UCB_reg];
        TS_regret       = [TS_regret; TS_reg];

        %U_KL_mu_exp = (U_KL_mu + U_KL_mu_exp*(trial-1))/trial;
        %U_UCB_mu_exp = (U_UCB_mu + U_UCB_mu_exp*(trial-1))/trial;
        %U_TS_mu_exp = (U_TS_mu + U_TS_mu_exp*(trial-1))/trial;


        %TS_timer = [TS_timer; timer1];
        %KL_timer = [KL_timer; timer2];
        %UCB_timer = [UCB_timer; timer3];

        KL_fixregret{e} = [KL_fixregret{e} KL_reg(T)];
        UCB_fixregret{e} = [UCB_fixregret{e} UCB_reg(T)];
        TS_fixregret{e} = [TS_fixregret{e} TS_reg(T)];
    end
    %NumArms = [NumArms numel(AvgThruput{e})];
    
    [cumreg_UCB, std_UCB, CI95_UCB] = RegretAnalysis([], UCB_regret{e}, Num_Trials);
    [cumreg_KL, std_KL, CI95_KL] = RegretAnalysis([], KL_regret{e}, Num_Trials);
    [cumreg_TS, std_TS, CI95_TS] = RegretAnalysis([], TS_regret{e}, Num_Trials);

    %save("UCB_result.mat")

    %PlotRegret(regret_U_KL,std_U_KL,CI95_U_KL,"Single Feedback OSUB-KLUCB")
    %PlotRegret(regret_U_TS,std_U_TS,CI95_U_TS,"Single Feedback OSUB-TS")

    %PlotRegret3(cumreg_U_UCB,cumreg_U_KL,cumreg_U_TS,std_U_UCB,std_U_KL,std_U_TS,...
    %    CI95_U_UCB,CI95_U_KL,CI95_U_TS,"UCB","KL-UCB","Thompson Sampling")
    %drawnow
    

end

KL_fixregret = mean(cell2mat(KL_fixregret),2);   UCB_fixregret = mean(cell2mat(UCB_fixregret),2);
TS_fixregret =  mean(cell2mat(TS_fixregret),2);

%KL_fixregret = [];   TS_fixregret = [];   UCB_fixregret = [];
%for e=1:length(AvgThruput)
%    KL_fixregret = [KL_fixregret mean(KL_regret{e}(:,T),1)];   UCB_fixregret = [UCB_fixregret mean(UCB_regret{e}(:,T),1)];
%    TS_fixregret =  [TS_fixregret mean(TS_regret{e}(:,T),1)];
%end

%NumArms = [numel(AvgThruput{1}) numel(AvgThruput{2}) numel(AvgThruput{3}) numel(AvgThruput{4})];
%% Compute and plot regret and statistics

figure
plot(1:Num_exp, UCB_fixregret,'k', 'LineWidth',1.5);
hold on
plot(1:Num_exp,KL_fixregret,'r', 'LineWidth',1.5);
plot(1:Num_exp,TS_fixregret,'b', 'LineWidth',1.5);
grid on
xlabel('Exploration Time')
ylabel("Regret at time slot "+num2str(T))
legend('UCB','KLUCB','Thompson Sampling')

%{
[cumreg_U_UCB, std_U_UCB, CI95_U_UCB] = RegretAnalysis(AvgThruput, U_UCB_regret, Num_Trials);
[cumreg_U_KL, std_U_KL, CI95_U_KL] = RegretAnalysis(AvgThruput, U_KL_regret, Num_Trials);
[cumreg_U_TS, std_U_TS, CI95_U_TS] = RegretAnalysis(AvgThruput, U_TS_regret, Num_Trials);

%save("UCB_result.mat")

%PlotRegret(regret_U_KL,std_U_KL,CI95_U_KL,"Single Feedback OSUB-KLUCB")
%PlotRegret(regret_U_TS,std_U_TS,CI95_U_TS,"Single Feedback OSUB-TS")

PlotRegret3(cumreg_U_UCB,cumreg_U_KL,cumreg_U_TS,std_U_UCB,std_U_KL,std_U_TS,...
    CI95_U_UCB,CI95_U_KL,CI95_U_TS,"UCB","KL-UCB","Thompson Sampling")
%}

% Plot processing time in a time slot
%{
figure
plot(mean(U_UCB_timer,1),'k', 'LineWidth',1.5);
hold on
plot(mean(U_KL_timer,1),'r', 'LineWidth',1.5);
plot(mean(U_TS_timer,1),'b', 'LineWidth',1.5);
grid on
xlabel('Time slot')
ylabel('Mean process time per time slot')
legend('UCB','KLUCB','Thompson Sampling')
%}
