// Nạp thư viện IPCV
atomsLoad('IPCV');

// Đọc ảnh và chuyển sang ảnh xám
img = imread('D:\LOGO-bk.png');  
if size(img, 3) == 3 then
    img_gray = rgb2gray(img);
else
    img_gray = img;
end
img_gray = uint8(img_gray);

// Xử lý tương phản và làm mờ ảnh
img_adj = imadjust(img_gray); 
h = (1/25) * ones(5, 5);
img_blur = uint8(imfilter(double(img_gray), h));

// Tính toán tần suất xuất hiện của các mức xám (0-255) cho Histogram
[counts, grayLevels] = imhist(img_gray);

// Hiển thị kết quả trực quan trên cửa sổ đồ họa
figure(1);

// Ô 1: Ảnh xám gốc
subplot(2, 2, 1);
imshow(img_gray);
title('1. Anh xam goc (Grayscale)');

// Ô 2: Histogram ảnh gốc (Dùng bar để vẽ biểu đồ cột ổn định tuyệt đối)
subplot(2, 2, 2);
bar(grayLevels, counts);
xgrid();
title('2. Histogram anh goc');

// Ô 3: Xử lý tương phản
subplot(2, 2, 3);
imshow(img_adj);
title('3. Xu ly tuong phan (Imadjust)');

// Ô 4: Làm mờ ảnh
subplot(2, 2, 4);
imshow(img_blur);
title('4. Lam mo anh (Blur 5x5)');
