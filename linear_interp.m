%Eksik veri oluşturup sonra interpolasyonla doldurma

x = [-4*pi: 0.1 :0, 0.1: 0.2: 4*pi];%[-4*pi: 0.1 :0 ]: -4π'den 0'a kadar 0.1 
% aralıklarla değer üretir.
%[ 0.1: 0.2: 4*pi ] Bu kısım 0.1'den 4π'ye kadar 0.2 aralıklarla değer üretir

A = sin(x);% Her x değeri için sinüs değeri hesaplanır.
%A, ölçüm verisi gibi düşünülebilir. Mesela x: Zaman A: Sensörden gelen
%sinyal değeri. Yani elimizde bir sinyal  var

A(A < 0.75 & A > 0.5)= NaN;%Bu satır bazı veri nooktalarını eksik veri haline getiriyor.
%NaN: Not a Nımber anlamına gelir yani burada geçerli bir sayı yok.
% 0.5 ve 0.75 ise o değeri sil veNaN olarak belirle.
%***Sensör bazı aralıklarda veri gönderemedi veya ölçüm alınamadı.

[F,TF] = fillmissing(A,"linear",SamplePoints=x);%fillmissing, Matlabın eksik 
% veri doldurmak için kullanılan fonksiyonudur.
% A:Eksik değerler içeren veri dizisi.
% "linear":Eksik değerler doğrusal interpolasyonla doldurulacak.
% Samplepoints=x: verilerin hangi x noktalarına karşılık geldiğini söyler.
% F: Eksiklerin tamamlanmış oldupu yeni dizi. TF: Hangi verilerin dolduruluduğunu
% gösteren mantıksal dizi. TF içinde true olan yerler: Matlab'ın doldurduğu
% false olan yerler: Zaten var olan noktalar.

scatter(x,A)% Bu satır orijinal veriyi nokta grafik olarak çizer. Yatay eksen: x 
% Dikey eksen:A
hold on%Önceki grafiği silme, yeni çizii aynı grafik üzerine ekle.
scatter(x(TF),F(TF))%Bu satır sadece Matlab'ın doldurduğu noktaları çizer. 
% x(TF): Eksik veri olan x konumlarını seçer.
% F(TF): Bu konumlarda interpolasyonla hesaplanan yeni değerleri seçer
legend("Original Data","Filled Data")