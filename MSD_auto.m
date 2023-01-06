clear all;
close all;
warning('off','all');

folder = 'data/1_down/';%%%%%image folder dir
outputpath = 'results/1_down/';
mkdir(outputpath);
d=dir(append(folder,'*.tif'));
skip = 0;
magnificationFactor=1;
% framerate = 50;
name = split(folder,'/');
name = string([strcat(outputpath,name(end-1))]);


for i=1:numel(d) 
% for i=1:100  
  if i == 1
      im=imread([folder d(i).name]);
      [centers, radii, metric] = imfindcircles(im,[3 30]);
      centers=centers(1,:);
      T1=table(i,centers);
      rawframes(:,:,:,i) = imresize(insertShape(im,'filled-circle',[centers(1),centers(2),2],'Color','red','LineWidth',1),magnificationFactor);

  else
      im=imread([folder d(i).name]);
      [centers, radii, metric] = imfindcircles(im,[3 30]);
      if isempty(centers) == 1
        im = cat(3, im, im, im);
        rawframes(:,:,:,i) = imresize(im,magnificationFactor);
        skip = skip+1;
        continue
      else
        centers=centers(1,:);
        T1=[T1;table(i,centers)];
        rawframes(:,:,:,i) = imresize(insertShape(im,'filled-circle',[centers(1),centers(2),2],'Color','red','LineWidth',1),magnificationFactor);
      end
  end
end


implay(rawframes);
v = VideoWriter(name,'MPEG-4');
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
saveas(gcf,strcat(name ,'_movingpath.png'));


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


format bank;%.2f
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
saveas(gcf,strcat(name, '_MSD.png'));
warning('on','all');