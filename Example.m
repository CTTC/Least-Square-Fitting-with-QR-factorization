close all;clear all;clc;
Aa=[3 -1 2;4 1 0;-3 2 1;1 1 5;-2 0 3];
Ba=[10 10 -5 15 0];
Ba=Ba';
Ab=[4 2 3 0;-2 3 -1 1;1 3 -4 2;1 0 1 -1;3 1 3 -2];
Bb=[10 0 2 0 5];
Bb=Bb';

display('**************************');
display('For system a:');
display('**************************');
[Qa1,Ra1]=QR_Householder(Aa);
Da1=Qa1'*Ba;
x_QR_householder1=Ra1(1:3,:)\Da1(1:3,:);
aError1=norm(Aa*x_QR_householder1-Ba);
fprintf('The least squared solutions found by using my own function QR_Householder are: \n');
display(['x_QR_householder= ' mat2str(x_QR_householder1)]);
fprintf('The 2-norm error is %9.8f\n',aError1);
display('===========================');

[Qa2,Ra2]=qr(Aa);
Da2=Qa2'*Ba;
x_qr1=Ra2(1:3,:)\Da2(1:3,:);
aError2=norm(Aa*x_qr1-Ba);
fprintf('The least squared solutions found by using matlab function qr are: \n');
display(['x_qr= ' mat2str(x_qr1)]);
fprintf('The 2-norm error is %9.8f\n',aError2);
display('===========================');

display('**************************');
display('For system b:');
display('**************************');
[Qb1,Rb1]=QR_Householder(Ab);
Db1=Qb1'*Bb;
x_QR_householder2=Rb1(1:4,:)\Db1(1:4,:);
bError1=norm(Ab*x_QR_householder2-Bb);
fprintf('The least squared solutions found by using my own function QR_Householder are: \n');
display(['x_QR_householder= ' mat2str(x_QR_householder2)]);
fprintf('The 2-norm error is %9.8f\n',bError1);
display('===========================');

[Qb2,Rb2]=qr(Ab);
Db2=Qb2'*Bb;
x_qr2=Rb2(1:4,:)\Db2(1:4,:);
bError2=norm(Ab*x_qr2-Bb);
fprintf('The least squared solutions found by using matlab function qr are: \n');
display(['x_qr= ' mat2str(x_qr2)]);
fprintf('The 2-norm error is %9.8f\n',bError2);
display('===========================');