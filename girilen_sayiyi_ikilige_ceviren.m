clc; clear;
sayi = input('2 tabanına çevrilecek sayıyı giriniz (Örn: 13.625): ');
% Sayıyı tam ve ondalıklı kısım olarak ikiye ayırıyoruz
tam_kisim = floor(sayi);
ondalik_kisim = sayi - tam_kisim;
%% BÖLÜM 1: TAM KISMI ÇEVİRME (Sürekli 2'ye bölme)
ikilik_tam = '';
temp_tam = tam_kisim; % İşlem yaparken asıl değeri bozmamak için temp kullandık

if temp_tam == 0
    ikilik_tam = '0';
else
    while temp_tam > 0
        kalan = mod(temp_tam, 2);
        ikilik_tam = [num2str(kalan), ikilik_tam]; % Kalanı başa ekle
        temp_tam = floor(temp_tam / 2); % Sayıyı küçült
    end
end
%% BÖLÜM 2: ONDALIKLI KISMI ÇEVİRME (Sürekli 2 ile çarpma)
ikilik_ondalik = '';
temp_ondalik = ondalik_kisim; % İşlem yapacağımız geçici kutu

if temp_ondalik > 0
    for i = 1:10 % En fazla 10 basamak hassasiyet
        temp_ondalik = temp_ondalik * 2;
        
        if temp_ondalik >= 1
            ikilik_ondalik = [ikilik_ondalik, '1']; % Sona 1 ekle
            temp_ondalik = temp_ondalik - 1;
        else
            ikilik_ondalik = [ikilik_ondalik, '0']; % Sona 0 ekle
        end
        if temp_ondalik == 0
            break; % Tam sonuç bulunduysa dur
        end
    end
end
%% BÖLÜM 3: SONUCU BİRLEŞTİRİP YAZDIRMA
if isempty(ikilik_ondalik)
    fprintf('İkilik karşılığı: %s\n', ikilik_tam);
else
    fprintf('İkilik karşılığı: %s.%s\n', ikilik_tam, ikilik_ondalik);
end