clc; clear;
% 1. Kullanıcıdan Girdileri Alalım
f = input('Fonksiyonu giriniz (Örn: @(x) x^2 - 3): ');
a = input('Aralığın sol ucunu (a) giriniz: ');
b = input('Aralığın sağ ucunu (b) giriniz: ');
hedef_hata = input('İstenen hata miktarını (tol) giriniz: ');
% 2. Bolzano Kontrolü (Başlangıçta kök var mı?)
if f(a) * f(b) >= 0
    error('Hata: Bu aralıkta zıt işaretli değerler yok, kök garantisi verilemez!');
end
% 3. Döngü Öncesi Hazırlık
mevcut_hata = (b - a) / 2; % İlk hata payımız aralığın yarısıdır
while mevcut_hata > hedef_hata
    c = (a + b) / 2; % Aralığı tam ortadan böl
    % Kök hangi yarıda ise diğer uç güncellenir 
    if f(a) * f(c) < 0
        b = c; % Kök sol tarafta, sağ sınırı merkeze çektik
    else
        a = c; % Kök sağ tarafta, sol sınırı merkeze çektik
    end    
    % Yeni hata payını hesaplıyoruz
    mevcut_hata = (b - a) / 2;
end
% Sonucu yazdırıyoruz
kok = (a + b) / 2;
fprintf('Hesaplanan yaklaşık kök: %f\n', kok);
fprintf('Elde edilen son hata payı: %f\n', mevcut_hata);