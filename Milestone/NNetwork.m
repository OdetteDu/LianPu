close all 
clear 
echo on 
clc 
% NEWFF——生成一个新的前向神经网络 
% TRAIN——对 BP 神经网络进行训练 
% SIM——对 BP 神经网络进行仿真 
pause        
%  敲任意键开始 
clc 
%  定义训练样本 
% P 为输入矢量 
P=[-1,  -2,    3,    1;       -1,    1,    5,  -3];
% T 为目标矢量 
T=[-1, -1, 1, 1]; 
pause; 
clc 
%  创建一个新的前向神经网络 
net=newff(minmax(P),[3,1],{'tansig','purelin'},'traingdm')
%  当前输入层权值和阈值 
inputWeights=net.IW{1,1} 
inputbias=net.b{1} 
%  当前网络层权值和阈值 
layerWeights=net.LW{2,1} 
layerbias=net.b{2} 
pause 
clc 
%  设置训练参数 
net.trainParam.show = 50; 
net.trainParam.lr = 0.05; 
net.trainParam.mc = 0.9; 
net.trainParam.epochs = 1000; 
net.trainParam.goal = 1e-3; 
pause 
clc 
%  调用 TRAINGDM 算法训练 BP 网络 
[net,tr]=train(net,P,T); 
pause 
clc 
%  对 BP 网络进行仿真 
A = sim(net,P) 
%  计算仿真误差 
E = T - A 
MSE=mse(E) 
pause 
clc 
echo off 
