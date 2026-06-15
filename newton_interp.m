% Newton Interpolation - Divided Differences
clear; clc; close all;
% Veri noktaları
x = [1 4 6];
y = [0 1.386294 1.791759];   % y = ln(x)
xq = 2;% Tahmin yapılacak nokta
n = length(x);
dd = zeros(n,n);% Bölünmüş fark tablosu
dd(:,1) = y(:);% İlk sütun f(x) değerleri
% Bölünmüş farkların hesaplanması
for j = 2:n
    for i = 1:n-j+1
        dd(i,j) = (dd(i+1,j-1) - dd(i,j-1)) / (x(i+j-1) - x(i));
    end
end
P = dd(1,1);% Newton polinomunun xq noktasında değerlendirilmesi
term = 1;
for k = 2:n
    term = term * (xq - x(k-1));
    P = P + dd(1,k) * term;
end
% Sonucu yazdır
fprintf("Newton tahmini P(%.2f) = %.6f\n", xq, P);
fprintf("Gerçek değer ln(%.2f) = %.6f\n", xq, log(xq));
fprintf("Mutlak hata = %.6f\n", abs(log(xq)-P));
% Grafik
xx = linspace(min(x), max(x), 200);
yy = zeros(size(xx));
for m = 1:length(xx)
    temp = dd(1,1);
    term = 1;
    for k = 2:n
        term = term * (xx(m) - x(k-1));
        temp = temp + dd(1,k) * term;
    end
    yy(m) = temp;
end
plot(x, y, "o", "MarkerSize", 8, "LineWidth", 1.5);
hold on;
plot(xx, yy, "LineWidth", 1.5);
plot(xq, P, "s", "MarkerSize", 8, "LineWidth", 1.5);
grid on;
legend("Veri noktaları", "Newton polinomu", "Tahmin noktası");
xlabel("x");
ylabel("f(x)");
title("Newton İnterpolasyonu");