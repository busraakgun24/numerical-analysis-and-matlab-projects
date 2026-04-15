clc; clear;
ikilik_str = input('2 tabanında bir sayı giriniz (Örn: 1101): ', 's'); % 's' metin olarak al demektir.
n = length(ikilik_str); % Sayı kaç basamaklı?
onluk_sayi = 0;
for i = 1:n
    % En sağdaki basamaktan başlamak için n-i kullanılır.
    % Karakteri sayıya çevirip 2'nin kuvvetiyle çarpıyoruz.
    basamak_degeri = str2double(ikilik_str(n-i+1)); 
    onluk_sayi = onluk_sayi + basamak_degeri * (2^(i-1));
end
fprintf('Girdiğiniz sayının 10 tabanındaki karşılığı: %ddir\n', onluk_sayi);