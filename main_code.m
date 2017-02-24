folder = fullfile(matlabroot, 'real length of pen');
baseFileName = 'pen1.jpg';
fullFileName = fullfile(folder, baseFileName); 
grayImage = imread(fullFileName);                       %return the details of image
[rows columns numberOfColorBands] = size(grayImage)     %show dimension of image in pixel
