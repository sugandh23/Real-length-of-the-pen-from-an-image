clear;
clc;
url1 = 'E:\projects\real length of pen\input_image.jpg'; %path of input image
url2 = 'E:\projects\real length of pen\reference_image.jpg';  %path of refernce image
pen1=imread(url1);   
ref1=imread(url2);
pen=rgb2gray(pen1);
ref=rgb2gray(ref1);
[rows1 columns1] = size(pen);
[rows2 columns2] = size(ref);
% It will find the index of intitial point of pen
for i=1:rows1
    for j=1:columns1
        flag=1;
        if pen(i,j)<70
            x=i;
            y=j;
            flag=0;  % flag is used for breaking the loop
        end
        if flag==0
            break;
        end
    end
    if flag==0
        break;
    end
end
% It will find the index of final point of pen
for i=rows1:-1:1
    for j=columns1:-1:1
        flag=1;
        if pen(i,j)<70
            x1=i;
            y1=j;
            flag=0;
        end
            if flag==0
        break;
    end
    end
    if flag==0
        break;
    end
end
% It will mark the initial and final point of pen with color
for j=-20:20
    for i=-100:100
        % fill a color of RGB is (250,62,150)
        pen1(j+x,i+y,1)=255;
        pen1(j+x,i+y,2)=62;
        pen1(j+x,i+y,3)=150;
        pen1(j+x1,i+y1,1)=255;
        pen1(j+x1,i+y1,2)=62;
        pen1(j+x1,i+y1,3)=150;
    end
end
imtool(pen1); % show original photo with mark
lengthOfpenINpixel=sqrt((x-x1)^2 + (y-y1)^2)   %calculate length of pen in pixel
% It will find the index of intitial point of reference object
for i=1:rows2
    for j=1:columns2
        flag=1;
        if ref(i,j)<70
            x=i;
            y=j;
            flag=0;
        end
        if flag==0
            break;
        end
    end
    if flag==0
        break;
    end
end
flag=1;
% It will find the index of intitial point of reference object
for i=rows2:-1:1
    for j=columns2:-1:1
        flag=1;
        if ref(i,j)<70
            x1=i;
            y1=j;
            flag=0;
        end
        if flag==0
            break;
        end
    end
    if flag==0
        break;
    end
end
% It will mark the initial and final point of reference with a color
for j=-20:20
    for i=-100:100
        % fill a color of RGB is (250,62,150)
        ref1(j+x,i+y,1)=255;
        ref1(j+x,i+y,2)=62;
        ref1(j+x,i+y,3)=150;
        ref1(j+x1,i+y1,1)=255;
        ref1(j+x1,i+y1,2)=62;
        ref1(j+x1,i+y1,3)=150;
    end
end
imtool(ref1);
ref_Length_IN_pixel = sqrt((x-x1)^2 + (y-y1)^2) %calculate length of refernce object in pixel
orignal_Length_OF_ref = 45;                     % known length of refernce object in mm
Length_of_PEN_in_mm = (orignal_Length_OF_ref*lengthOfpenINpixel)/ref_Length_IN_pixel
Length_OF_pen_in_cm = Length_of_PEN_in_mm/10
