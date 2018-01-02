clear all;


x_axis = -0.4:0.02:0.4;
x = 0.1*randn(10000,1);
exp_axis = exp(-0.33):0.01:exp(0.33);
exp_x  = exp(x);
mean_ex = mean(exp_x);

figure
subplot(211)
hist(x,x_axis) 
subplot(212)
hist(exp_x,exp_axis)