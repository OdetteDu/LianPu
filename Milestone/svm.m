addpath('liblinear-1.94/matlab');
x_train=load('x_train.dat');
y_train=load('y_train.dat');
model = train(y_train, sparse(x_train) ,'liblinear_options');

x_test=load('x_test.dat');
y_test=load('y_test.dat');


[predicted_label] = predict(y_test, sparse(x_test), model , 'liblinear_options');