clc; clear;
sayi = input('Ondalıklı bir sayı giriniz (Örn: 12.625): ');
% 1. Tam kısmı ayır ve çevir
tam_kisim = floor(sayi);
ondalik_kisim = sayi - tam_kisim;
ikilik_tam = dec2bin(tam_kisim); % Tam kısım için hazır fonksiyonu kullanalım
% 2. Ondalıklı kısmı çevir (Çarpma yöntemi)
ikilik_ondalik = '';
hassasiyet = 10; % Virgülden sonra kaç basamak gitsin?
temp_ondalik = ondalik_kisim;
for i = 1:hassasiyet
    temp_ondalik = temp_ondalik * 2;
    if temp_ondalik >= 1
        ikilik_ondalik = [ikilik_ondalik, '1'];
        temp_ondalik = temp_ondalik - 1;
    else
        ikilik_ondalik = [ikilik_ondalik, '0'];
    end  
    if temp_ondalik == 0 % Eğer tam bölünürse döngüden çık
        break;
    end
end
% 3. Sonuçları birleştir
fprintf('Sayının 2 tabanındaki karşılığı: %s.%s\n', ikilik_tam, ikilik_ondalik);