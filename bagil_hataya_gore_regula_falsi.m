clc; clear;
% 1. Kullanıcıdan Girdileri Alalım
f = input('Fonksiyonu giriniz (Örn: @(x) x^3 - x - 1): ');
a = input('Aralığın başlangıcı (a): ');
b = input('Aralığın bitişi (b): ');
tol = input('İstenen bağıl hata miktarı: ');
% 2. Başlangıç Kontrolü (Bolzano)
if f(a) * f(b) >= 0
    error('Bu aralıkta kök garantisi yok!');
end
% 3. Döngü Öncesi Hazırlık
hata = 100; % Döngüye girebilmek için başlangıçta büyük bir değer verdik
x_eski = a; % Bir önceki adımı saklamak için (hata hesabı için lazım)
while hata > tol
    % Regula Falsi (Yer Değiştirme) Formülü
    % Bu formül bizi köke daha hızlı yaklaştırır
    x_yeni = b - (f(b) * (a - b)) / (f(a) - f(b));
    % Bağıl hata hesaplama
    % Formül: |(Yeni Değer - Eski Değer) / Yeni Değer|
    hata = abs((x_yeni - x_eski) / x_yeni);
    % Kök hangi tarafta? (Aralık güncelleme)
    if f(a) * f(x_yeni) < 0
        b = x_yeni; % Kök sol tarafta kalıyor
    else
        a = x_yeni; % Kök sağ tarafta kalıyor
    end
    x_eski = x_yeni; % Bir sonraki adım için şimdiki değeri "eski" yapıyoruz
end
% 4. Sonucu Yazdır
fprintf('Yaklaşık kök: %f\n', x_yeni);
fprintf('Elde edilen son bağıl hata: %f\n', hata);