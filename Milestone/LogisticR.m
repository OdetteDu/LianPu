x_train1=load('x_train.dat');
y_train=load('y_train.dat');

[num_train,num_feature]=size(x_train1);
x_0=ones(num_train,1);
x_train=[x_0 x_train1];
num_feature=num_feature+1;
for i=1:num_train
    if y_train(i)==-1
        y_train(i)=0;
    end
end
theta=zeros(num_feature,1);
tolerance=1000;
change=10000;
prev=zeros(num_feature,1);
count=0;
while (change>tolerance)
    count=count+1;
    stepsize=1/sqrt(count);
    prev=theta;
    for i=1:num_train
        theta=theta+stepsize*(y_train(i)-(1/(1+exp((-1)*x_train(i,:)*theta))))*(x_train(i,:).');
    end
    change=norm(theta-prev)
end
count
correct=0;
for i=1:num_train
    score=1/(1+exp((-1)*x_train(i,:)*theta));
    if (score>0.5)
        if (y_train(i)==1) 
            correct=correct+1;
        end
    end
    if (score<0.5)
        if (y_train(i)==0) 
            correct=correct+1;
        end
    end
end
correct/num_train

x_test1=load('x_test.dat');
y_test=load('y_test.dat');
correct=0;
[num_test,num_feature]=size(x_test1);
num_feature=num_feature+1;
x_0=ones(num_test,1);
x_test=[x_0 x_test1];
for i=1:num_test
    if y_test(i)==-1
        y_test(i)=0;
    end
end
for i=1:num_test
    score=1/(1+exp((-1)*x_test(i,:)*theta));
    if (score>0.5)
        if (y_test(i)==1) 
            correct=correct+1;
        end
    end
    if (score<0.5)
        if (y_test(i)==0) 
            correct=correct+1;
        end
    end
end
correct/num_test