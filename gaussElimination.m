function [X] = gaussElimination(A, b)
% GAUSS ELEME YÖNTEMİ (KISMI PİVOTLAMA VE GERİYE DOĞRU YERİNE KOYMA İLE)
% Bu fonksiyon, Ax = b şeklindeki lineer denklem sistemlerini çözmek için
% Sayısal Analiz (Numerical Analysis) disiplininde kullanılan temel bir algoritmadır.
% Girdiler (Inputs):
%   A : n x n boyutunda katsayılar matrisi (Kare matris olmalıdır)
%   b : n x 1 boyutunda sonuç vektörü
% Çıktılar (Outputs):
%   X : n x 1 boyutunda bilinmeyen kökler vektörü
% Matris boyut kontrolü ve doğrulanması
[satir, sutun] = size(A);
if satir ~= sutun
    error('Hata: Katsayılar matrisi (A) kare matris olmalıdır!');
end
n = length(b); % Bilinmeyen sayısı
% 1. ADIM: Genişletilmiş Matrisin (Augmented Matrix) Oluşturulması
% Katsayılar matrisi ile sonuç vektörünü tek bir matriste birleştiriyoruz.
Aug = [A, b];
% 2. ADIM: İleri Doğru Eleme (Forward Elimination) ve Kısmi Pivotlama
for i = 1:n-1
    % --- KISMI PİVOTLAMA (Sıfıra Bölme ve Yuvarlama Hatalarını Önleme) ---
    % Mevcut sütundaki (i'den n'e kadar olan satırlardaki) en büyük elemanı buluyoruz.
    [maxDeger, maxSatirIndeksi] = max(abs(Aug(i:n, i)));
    % Alt matristen gelen indeksi gerçek satır numarasına dönüştürüyoruz
    gercekSatir = maxSatirIndeksi + i - 1; 
    % Eğer sütundaki en büyük sayı sıfıra çok yakınsa sistem tekildir (Çözümü yoktur)
    if maxDeger < 1e-9
        error('Hata: Matris tekildir veya sonsuz çözümü vardır. Pivot sıfır olamaz!');
    end
    %SATIR TAKASI (Boş Bardak / Yedekleme Mantığı)
    % Eğer en büyük eleman mevcut bulunduğumuz satırda (i) değilse satırları takas ediyoruz.
    if gercekSatir ~= i
        gecici = Aug(i, :);                  % Mevcut satırı yedeğe al
        Aug(i, :) = Aug(gercekSatir, :);     % En büyük elemanlı satırı yukarı taşı
        Aug(gercekSatir, :) = gecici;         % Yedeği, alt satıra yerleştir
    end
    %ALT SATIRLARI SIFIRLAMA İŞLEMİ
    % Pivot elemanının altında kalan tüm hücreleri sıfırlayarak üst üçgen matris oluşturuyoruz.
    for j = i+1:n
        % Çarpan (m) hesaplanıyor: Hedef hücrenin pivot hücresine oranı
        carpan = Aug(j, i) / Aug(i, i);

        % Satır operasyonu: Mevcut satırdan, pivot satırın çarpan katını çıkar
        Aug(j, i:n+1) = Aug(j, i:n+1) - carpan * Aug(i, i:n+1);
    end
end

% 3. ADIM: Geriye Doğru Yerine Koyma (Back-Substitution)
% Kökleri depolamak için sıfırlardan oluşan boş bir vektör açıyoruz
X = zeros(n, 1);
% En alt satırda tek bir bilinmeyen kaldığı için ilk kökü doğrudan çözüyoruz
X(n) = Aug(n, end) / Aug(n, n);
% Aşağıdan yukarıya doğru tırmanarak diğer tüm bilinmeyenleri çözüyoruz
for i = n-1:-1:1
    % lisedeki denklem çözme mantığı:
    % Eşitliğin sağındaki sonuçtan (Aug(i,end)), o ana kadar bulduğumuz 
    % ve katsayılarıyla çarptığımız diğer bilinmeyenleri çıkarıyoruz.
    bilinenlerToplami = Aug(i, i+1:n) * X(i+1:n);

    % Kalan net sonucu, aradığımız bilinmeyenin kendi katsayısına bölüyoruz
    X(i) = (Aug(i, end) - bilinenlerToplami) / Aug(i, i);
end

% Sonuçları ekrana yazdırma
disp('=== Gauss Eleme Yöntemi ile Başarıyla Çözüldü ===');
end