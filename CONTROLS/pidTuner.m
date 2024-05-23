%defining open loop TF
numerator=1;
denominator = [1,10,20];
s = tf('s');
P= tf(numerator, denominator);

%Generating a P controller pidtool (P, 'p')
pidtool(P, 'p')

%Generating a PID controller 
C = pid(500,400,50);
pidtool(P, C);

%Using pidtune 
[autoPID, info] = pidtune(P, C); 
closedsys_autopid = feedback (autoPID*P, 1);

%Plotting response 
step(closedsys_autopid)
hold on
PID = pid(500,400,50);
tf (PID);
closedsys_pid = feedback (PID*P,1); 
step (closedsys_pid) 
title('PID controller generated with pidtune compared to baseline')
