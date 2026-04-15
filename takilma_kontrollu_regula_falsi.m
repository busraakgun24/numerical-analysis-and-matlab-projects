clc; clear;
% 1. Girdileri alıyoruz
f = input('Fonksiyonu giriniz(Örn:@(x) x^4-x^2-7): ');
a = input('Aralığın başlangıcını giriniz(a): '); b = input('Aralığın bitişini giriniz(b): ');
tol = input('Tolerans: ');
% 2. Sayaçlar (Kaç kere takıldığımızı saymak için)
a_sayac = 0; 
b_sayac = 0; 
hata = 100;
x_eski = a;
while hata > tol
    % Normal Regula Falsi Formülü
    x_yeni = b - (f(b) * (a - b)) / (f(a) - f(b));   
    % TAKILMA KONTROLÜ 
    if f(a) * f(x_yeni) < 0
        b = x_yeni;
        b_sayac = 0;          % b değişti, sayacı sıfırla
        a_sayac = a_sayac + 1; % a sabit kaldı, sayacı bir artır
    else
        a = x_yeni;
        a_sayac = 0;          % a değişti, sayacı sıfırla
        b_sayac = b_sayac + 1; % b sabit kaldı, sayacı bir artır
    end
    % Eğer bir uçta 3 defadan fazla takılırsak aralığı yarılarız
    if a_sayac > 3 || b_sayac > 3
        fprintf('Sistem takıldı, aralık yarılanıyor...\n');
        x_yeni = (a + b) / 2; % Zorla orta noktaya git 
        % Aralığı tekrar güncelle ve sayaçları resetle
        if f(a) * f(x_yeni) < 0, b = x_yeni; else, a = x_yeni; end
        a_sayac = 0; b_sayac = 0;
    end
    hata = abs((x_yeni - x_eski) / x_yeni);
    x_eski = x_yeni;
end
fprintf('Hesaplanan yaklaşık kök: %f\n', x_yeni);