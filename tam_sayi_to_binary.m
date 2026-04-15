clc; clear;
%Kullanıcıdan Girdiyi Alalım
sayi = input('2 tabanına çevrilecek tam sayıyı giriniz: ');
ikilik_str = ''; % Sonucu içinde biriktireceğimiz metin kutusu
temp_sayi = sayi; % İşlem yaparken orijinal sayıyı kaybetmemek için yedekliyoruz
%Özel Durum Kontrolü
if temp_sayi == 0
    ikilik_str = '0';
else
    %Sürekli Bölme Döngüsü
    while temp_sayi > 0
        kalan = mod(temp_sayi, 2); % 2'ye bölümden kalan (0 veya 1)
        % DİKKAT: Kalanı mevcut metnin BAŞINA ekliyoruz. 
        % Çünkü ilk bulduğumuz kalan en sağdaki basamaktır.
        ikilik_str = [num2str(kalan), ikilik_str]; 
        % Sayıyı 2'ye bölüp aşağı yuvarlayarak devam ediyoruz
        temp_sayi = floor(temp_sayi / 2); 
    end
end
%Sonucu Yazdıralım
fprintf('Girdiğiniz %d sayısının 2 tabanındaki karşılığı: %s\n', sayi, ikilik_str);