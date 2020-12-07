clear all;
close all;
videoRead = VideoReader('newfile.avi'); %读取视频
nFrameRead = videoRead.NumberOfFrames;  %获得视频的帧数
% vidHeightRead = videoRead.Height;       %获得视频高度
% vidWidthRead = videoRead.width;         %获得视频宽度
for i = 1 : nFrameRead;   %对每帧图像做空间域滤波处理
    %命名 jpg默认为YCbCr通道
    strtemp = strcat('F_new',int2str(i),'.','jpg');    
    F = read(videoRead,i);
    Y = F(:,:,1);                       %获得图像的三个通道的灰度值
    Cb = F(:,:,2);
    Cr = F(:,:,3);
%   H = fspecial('average',[3 3]); % 均值滤波算子
%     H = fspecial('gaussian',[3 3],0.5); % 高斯滤波算子
%     F_Y=imfilter(Y,H,'replicate');
%     F_Cb=imfilter(Cb,H,'replicate');
%     F_Cr=imfilter(Cr,H,'replicate');  
    F_Y=medfilt2(Y,[3 3]);             %对图像进行中值滤波处理
    F_Cb=medfilt2(Cb,[3 3]);
    F_Cr=medfilt2(Cr,[3 3]);
    F_new = cat(3,F_Y,F_Cb,F_Cr);      %将三个通道联结在一起 cat函数
    imwrite(F_new,strtemp,'JPG');       % 将图片序列保存为图片文件
end
myobj = VideoWriter('result.avi');     % 新建一个视频文件
writerObj.FrameRate =30;               % 定义每秒的帧数
open(myobj);                           % 打开视频文件
for i = 1:nFrameRead;                  % 将图像重新生成视频文件
    fname = strcat('F_new',num2str(i),'.jpg');
    frame = imread(fname);
    writeVideo(myobj,frame);           
end
close(myobj);