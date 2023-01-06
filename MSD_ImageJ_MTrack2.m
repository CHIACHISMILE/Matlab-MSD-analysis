clear all;
close all;

folder = 'data/1_down/';%%%%%image folder dir
outputpath = 'results/1_down/';
mkdir(outputpath);
d=dir(append(folder,'*.tif'));
skip = 0;
magnificationFactor=1;
% framerate = 50;
name = split(folder,'/');
name = string([strcat(outputpath,name(end-1))]);



M = readmatrix('/imj_track_res/trackresults_1_down.txt');% read Trackresults.txt
for i=1:numel(d) 
% for i=1:150  ####set your length of Loop
  if i == 1
      im=imread([folder d(i).name]);
      centers = M(i,2:3);
      T1=table(i,centers);
      rawframes(:,:,:,i) = imresize(insertShape(im,'filled-circle',[centers(1),centers(2),2],'Color','red','LineWidth',1),magnificationFactor);
      
  else
      im=imread([folder d(i).name]);
      centers = M(i,2:3);
      if isempty(centers) == 1
        im = cat(3, im, im, im);
        rawframes(:,:,:,i) = imresize(im,magnificationFactor);
        skip = skip+1;
        continue
      else
        T1=[T1;table(i,centers)];
        rawframes(:,:,:,i) = imresize(insertShape(im,'filled-circle',[centers(1),centers(2),2],'Color','red','LineWidth',1),magnificationFactor);
      end
  end
end


implay(rawframes);%preview video
v = VideoWriter(strcat(name,'_imj'),'MPEG-4');%save video in MP4
v.Quality = 100;
v.FrameRate = 50;
open(v);
writeVideo(v,rawframes);
close(v)

arr=table2array(T1);
X=arr(:,2);Yp=127-arr(:,3);Y=arr(:,3);

figure;
plot(X,Yp,'b');
xlabel('x(pixel=0.11um)');
ylabel('y(pixel=0.11um)');
title('Moving Path');
grid on;
saveas(gcf,strcat(name,'_imj__movingpath.png'));%save moving Path


xsize=size(X,1);
ysize=size(Y,1);
datasize=min(xsize,ysize);

dt=1;%init loop var
msd_total=[];
y1=[];


while (dt<datasize)
    for i=1:datasize-dt
        dx(i,1)=X(i+dt,1)-X(i,1);
        dy(i,1)=Y(i+dt,1)-Y(i,1);
    end
    msd=sum(dx.^2+dy.^2)/(datasize-dt);
    msd_total=[msd_total,msd];
    dx=[];
    dy=[];
    dt=dt+1;
end

figure;
len = length(msd_total);
x = (1:len)';
y_new = msd_total';
scatter(x,y_new);
hold on;
xx = [ones(length(x),1) x];
b1 = xx\y_new;
yCalc1 = b1(2)*x+b1(1);
plot(x,yCalc1,'--',"LineWidth",2);

format bank;
new_xticks=0:25:200;
xticks(new_xticks);
xticklabels({0:0.5:4});
title('Mean Square Displacement');
xlabel('time(sec)');
ylabel('MSD');
leg =legend('MSD','linear regression','Location','best');
b=num2str(b1(2));
txt = strcat('correlation coefficient=',b);
title(leg,txt);

skip;
if skip > numel(d)*0.3 
    printf('Skipped too much, This Result is not reliable');
end
saveas(gcf,strcat(name,'_imj_MSD.png'));%save MSD result