// Khai báo tín hiệu x(n) và h(n)
xn = [1, 2, -3, 2, 1];
xorigin = 1; 

hn = [1, 0, -1];
horigin = 1;

// 1. Tính chập tuyến tính y(n)
yn = convol(xn, hn);
yorigin = xorigin + horigin - 1;

nx = (1:length(xn)) - xorigin;
nh = (1:length(hn)) - horigin;
ny = (1:length(yn)) - yorigin;

// 2. Tính năng lượng tích lũy của tín hiệu
Ey = cumsum(yn.^2);

// 3. Trực quan hóa x(n), y(n) và năng lượng trên cùng cửa sổ đồ thị
figure(1);

subplot(3, 1, 1);
plot2d3(nx, xn, style=2); plot(nx, xn, 'ro');
title("Tín hiệu đầu vào x(n)"); xlabel("n"); ylabel("x(n)"); xgrid();

subplot(3, 1, 2);
plot2d3(ny, yn, style=5); plot(ny, yn, 'mo');
title("Tín hiệu đầu ra chập y(n) = x(n) * h(n)"); xlabel("n"); ylabel("y(n)"); xgrid();

subplot(3, 1, 3);
plot(ny, Ey, 'b-o');
title("Năng lượng tích lũy của tín hiệu y(n)"); xlabel("n"); ylabel("Energy"); xgrid();
