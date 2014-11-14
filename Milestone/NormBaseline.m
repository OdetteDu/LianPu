x=load('x_train.dat');
y=load('y_train.dat');

[row,col]=size(x);
num_features=col/2;
correct=0;
max=0;
result_threshold=0;

for k=1:100
    threshold=0.01*k;
    correct=0;
    for i=1:row
        sum=0;
        for j=1:num_features
            sum=sum+(x(i,j)-x(i,j+num_features))^2;
        end
        score=1/sqrt(sum);
        if (score>threshold)
            if (y(i)==1) 
                correct=correct+1;
            end
        end
        if (score<threshold)
            if (y(i)==-1) 
                correct=correct+1;
            end
        end
    end
        if (correct/row>max)
            max=correct/row;
            result_threshold=threshold;
        end
end
max
result_threshold
x=load('x_test.dat');
y=load('y_test.dat');

[row,col]=size(x);
num_features=col/2;
correct=0;
for i=1:row
    sum=0;
    for j=1:num_features
        sum=sum+(x(i,j)-x(i,j+num_features))^2;
    end
    score=1/sqrt(sum);
    if (score>result_threshold)
        if (y(i)==1) 
            correct=correct+1;
        end
    end
    if (score<result_threshold)
        if (y(i)==-1) 
            correct=correct+1;
        end
    end
end
correct/row
