url1 = 'E:\projects\real length of pen\1.jpg';
url2 = 'E:\projects\real length of pen\2.jpg';
url3 = 'E:\projects\real length of pen\3.jpg';
blank = imread(url1);
pen=imread(url2);
ref=imread(url3);
[rows1 columns1 numberOfColorBands1] = size(blank);
[rows2 columns2 numberOfColorBands2] = size(pen);
[rows3 columns3 numberOfColorBands3] = size(ref);
for i=rows1:-1:1
    for j=columns2:-1:1
        if pen(i,j)~=blank(i,j)
            x=i;
            y=j;
            break;
        end
    end
end
x
y
