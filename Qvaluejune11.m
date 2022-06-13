mA= 7483.60952;
ma=1876.1350;
mb= 1876.1350;
mB= 7483.60952;
hel=7483.60952;
 hl=1876.1350;   % we have defined all the values of constants
hell=7483.60952;
hll=1876.1350;
Q=0;
%I1=((9.76+58.8*(Z)^-1.19)*Z)/1000000;
E_center_Tgt=66.80;
E_center=E_center_Tgt/1000;
Ta=66.80;
for theta=5:1:90    % for loop used to find all the values of Eb with respect to theta and that values are used to find PB_det
 Eb =(((sqrt(hel*hl*Ta))*cosd(theta)+(sqrt(hel*hl*Ta*(cosd(theta))^2+(hell+hl)*(hell*Q+(hell-hel)*Ta))))/(hell+hl))^2;
 

Eb1=Eb/1000;
Pb=sqrt(Eb1*Eb1+2*Eb1*mb);
PA=sqrt(E_center*E_center+2*E_center*mA);
P_center=sqrt(E_center*E_center+2*E_center*mA);
 phi=asind((Pb/PB_det)*sind(theta));
EB_det=E_center+mA+ma-Eb1-mb;
PB_det=sqrt(P_center*P_center+Pb*Pb-2*P_center*Pb*cosd(theta));
Qdet=mA+ma-mb-sqrt(EB_det*EB_det-PB_det*PB_det);
Qdet1=Qdet*1000;


                
                fid=fopen('data4.txt','a+');
                fprintf(fid,'%10.4f %10.4f %10.4f %10.4f\n',Eb',phi',Qdet',Qdet1');
  fclose(fid);
end
% this next program will read files from text file created above and plot the graph
M= load('data4.txt');
x= M(:,1)';
y1=M(:,2)';
y2=M(:,3)';
y3=M(:,4)';
plot(x,y2,'b','Markersize',2,'LineWidth',2)
hold on
 % plot(y1,y3,'r','Markersize',2,'LineWidth',2)
 %hold on
set(gca,'FontSize',16,'FontWeight','bold','linewidth',2)
r=xlabel('{\bf Theta $\theta$}','interpreter','latex');
s=ylabel('{\bf Energy of target like particle(MeV)}','interpreter','latex');
set(r,'FontSize',16);
set(r,'FontWeight','bold');
set(s,'FontSize',16);
set(s,'FontWeight','bold');