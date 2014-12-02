x_train=load('x_train.dat');
y_train=load('y_train.dat');
x_test=load('x_test.dat');
y_test=load('y_test.dat');

[num_train,num_feature]=size(x_train);
x_train = x_train(:,[40,41,42,43,44,84,85,86,87,88]);
x_test = x_test(:,[40,41,42,43,44,84,85,86,87,88]);
out=zeros(num_train,2);
for i=1:num_train
    if (y_train(i)==1)
        out(i,1)=1;
    else
        out(i,2)=1;
    end
end

%创建神经网络
net = newff( minmax(x_train.') , [5,2,2] , { 'logsig' 'tansig' 'purelin' } , 'traingdx' );

%设置训练参数
net.trainParam.show = 50; 
net.trainParam.lr = 0.01; 
net.trainParam.epochs = 500; 
net.trainParam.goal = 0.1; 

%开始训练
[net,tr]=train(net,x_train.',out.'); 

correct=0;
Y = sim( net ,x_train.' ) ;
for i=1:num_train
    if (Y(1,i)>Y(2,i))
        if (y_train(i)==1)
            correct=correct+1;
        end
    end
    if (Y(1,i)<Y(2,i))
        if (y_train(i)==-1)
            correct=correct+1;
        end
    end
end
correct/num_train



correct=0;
[num_test,num_feature]=size(x_test);
Z = sim( net ,x_test.' );
for i=1:num_test
    if (Z(1,i)>Z(2,i))
        if (y_test(i)==1)
            correct=correct+1;
        end
    end
    if (Z(1,i)<Z(2,i))
        if (y_test(i)==-1)
            correct=correct+1;
        end
    end
end
correct/num_test





