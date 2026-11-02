// Khai báo tín hiệu và vị trí gốc thời gian (origin)
xn = [1, 2, -3, 2, 1];
xorigin = 1; // Phần tử đầu tiên tương ứng n = 0

hn = [1, 0, -1, -1, 1];
horigin = 1;

// Tính chập vòng (Circular Convolution) sử dụng ma trận Circulant
N = length(xn);
H = toeplitz([hn(1), hn($:-1:2)], hn);
yn = (H * xn')';

// Xác định trục thời gian n dựa trên origin
nx = (1:length(xn)) - xorigin;
nh = (1:length(hn)) - horigin;
ny = 0:(N-1); // Chập vòng có độ dài N = 5

// Tính năng lượng tích lũy của tín hiệu y(n)
Ey = cumsum(yn.^2);

// Thiết lập cửa sổ đồ họa
figure(1);
clf();

// 1. Đồ thị tín hiệu đầu vào x(n)
subplot(3, 1, 1);
plot2d3(nx, xn, style=2); 
plot(nx, xn, 'ro');
title("Tín hiệu đầu vào x(n)"); 
xlabel("n"); 
ylabel("x(n)"); 
xgrid();

// 2. Đồ thị tín hiệu đầu ra chập vòng y(n)
subplot(3, 1, 2);
plot2d3(ny, yn, style=5); 
plot(ny, yn, 'mo');
title("Tín hiệu đầu ra chập vòng y(n) = x(n) (N) h(n)"); 
xlabel("n"); 
ylabel("y(n)"); 
xgrid();

// 3. Đồ thị năng lượng tích lũy của y(n)
subplot(3, 1, 3);
plot(ny, Ey, '-o');
title("Năng lượng tích lũy của tín hiệu y(n)"); 
xlabel("n"); 
ylabel("Energy"); 
xgrid();
