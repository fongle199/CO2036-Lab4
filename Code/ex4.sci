// 1. Đọc file âm thanh WAV
filename = 'D:/sample.wav';
[y, Fs] = audioread(filename);

// Nếu file là stereo (có 2 cột), gộp lại thành mono (1 cột) để dễ vẽ đồ thị
if size(y, 2) > 1 then
    y = mean(y, 2);
end

// 2. Lấy số mẫu chuẩn xác từ mảng y thực tế
n_samples = length(y);
duration = n_samples / Fs;
mprintf("Tần số lấy mẫu Fs = %d Hz\n", Fs);
mprintf("Tổng số mẫu = %d\n", n_samples);
mprintf("Thời lượng audio = %.2f giây\n", duration);

// 3. Tạo vector thời gian t khớp tuyệt đối với số mẫu của y
t = (0:n_samples - 1) / Fs;

// 4. Trực quan hóa tín hiệu âm thanh
figure(1);
plot(t, y);
title("Dạng sóng tín hiệu âm thanh (Audio Waveform)");
xlabel("Thời gian (giây)");
ylabel("Biên độ");
xgrid();

// 5. Xử lý tín hiệu: Khuếch đại và chống méo tiếng
y_amplified = 1.5 * y;
y_amplified = max(min(y_amplified, 1), -1);

// 6. Lưu file kết quả
audiowrite('D:/output_amplified.wav', y_amplified, Fs);
mprintf("Đã xử lý và lưu file thành công!\n");
