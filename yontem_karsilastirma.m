%Tablolu Yöntem Karşılaştırma Programı
clc;clear;%clc:Command window'u(Alt ekranı) temizler 
%Clear:Workspace'i (sağdaki değişken hafızasını)temizler.
% Denklem Tanımları
f=@(x)4.5*x-2*cos(x);%bunlar anonim fonksiyonlardır.Bilgisayara 
% x diye bir sayı geldiğinde şu formülü uygula diyoruz. Ana denklem
df=@(x)4.5+2*sin(x);%Newton-Raphson için türevi
g=@(x) (2*cos(x))/4.5;%Sabit Nokta için x = g(x) formu
%Başlangıç Değerleri
a=0; b=1; %Aralık yöntemleri için.İkiye bölme ve Regula-Falsi bir aralık ister,
% 0 ile 1'i verdik diğerleri ise ortadan başlar.
x0= 0.5; x1= 0.6;  % İteratif yöntemler için
n_max= 5;%5 adımda hesaplanacak
%Tabloyu saklamak için matris
sonuclar= zeros(n_max, 5);%Hafıza ve değişken hazırlığı. Bilgisayara 5 satır 
% ve 5 sütunluk bir matris ayırmasını söylüyoruz.
%1. Newton-Raphson (Örnek Adımlar)
% Yeni yöntemlerin başlangıç atamaları
xn= x0;%Newton Raphson için güncel x
s0= x0; s1 = x1;%Sekant için x_eski ve x_yeni
low_b = a; high_b = b; %ikiye blme sınırları
xg=x0;%sabit nokta güncel x
low_rf = a; high_rf = b;%Regula falsi sınırları
%Her yöntemin kendine has bir x değişkeni olmak zorunda. Eğer hepsi aynı x harfini
% kullansaydı Newton'ın bulduğuy sonuç bisection'u bozardı hepsinin kulvarını ayırdık.
for i= 1:n_max%Bu blok 5 kez dönecek.Yani her yöntem sırayla 1.adımını,sonra 2.adımını yapacak.
    xn= xn - f(xn)/df(xn);%teğet formülü. Yeni xn'i hesaplayıp eskisine yazıyor.
    sonuclar(i, 1) = xn;%Bulduğu sayıyı, tablomuzun i. satırının 1. sütununa kaydediyor.
    %2.Sekant Yöntemi: Türev almadan iki nokta s0 ve s1 arasındaki farkı alıp
    s2 = s1 - (f(s1)*(s1-s0)) / (f(s1)-f(s0));
    sonuclar(i, 2)= s2; %yenibir s2 buluyor. Tablonun 2. sütununa yazıyor.
    s0 = s1; s1 = s2;%Aonra bir bir sonraki adım için eski değeri kaydırıyor.
    %3.İkiye Bölme (Bisection)
    mid = (low_b + high_b) / 2;%aralığın ortasını buluruz. +
    sonuclar(i, 3) = mid;% Tablonun 3. sütununa yazar
    if f(low_b)*f(mid) < 0
        high_b = mid; 
    else, low_b = mid; 
    end
    %4. Sabit Nokta İterasyonu
    xg = g(xg); 
    sonuclar(i, 4)= xg;% Tablonun 4. sütununa yazar
    % 5. Regula-Falsi
    rf=high_rf-(f(high_rf)*(high_rf-low_rf))/(f(high_rf)-f(low_rf));
    sonuclar(i, 5) = rf;% Tablonun 5. sütununa yazar
    if f(low_rf)*f(rf) < 0
        high_rf = rf;
    else
        low_rf = rf;
    end
end
% Sonuçları Göster
Yontemler={'Newton_Raphson','Sekant','İkiye_Bolme','Sabit_Nokta','Regula_Falsi'};%En üstte gösterilecek başlıkları bir sücre içine işledik
T=array2table(sonuclar, 'VariableNames', Yontemler);%sonuclar matrisini al, bunu güzel bir "Tablo" objesine (T) dönüştür. Sütun isimleri
% olarak da
% VariableNames
% bizim hazırladığımız o yontemler listesini kullan demiş oluruz
disp(T);%display:Tabloyu ekrana bastırır