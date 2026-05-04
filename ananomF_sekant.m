%Sekant (Kiriş) Yöntemi-Türevsiz Newton
%Avantaj:Türevle uğraşmazsın. Dezavantaj:Başlamak için bir değil, iki başlangıç tahmini gerekir.
%Sekant türev almaz; onun yerine iki nokta (x0,x1) seçer ve aralarına bir
%düz çizgi çeker->kiriş. Bu çizginin x eksenini kestiği yer yeni noktadır.
%Newton Raphson harikadır ama her fonksiyonun türevini almak (özellikle
%karmaşık mühendislik problemlerinde) imkansız olabilir
f=@(x)x^3-x-1;%Bu bir anonim fonksiyon tanımlamasıdır.Neden? Çözmek istediğimiz denklemi bilgisyara tanıtır.
%Burada x^3-x-1=0 denkleminin kökünü(sıfır noktasını) arıyoruz.
x0= 1; % Birinci başlangıç noktası tahmini Ne demek? Sekant yöntemi, bir doğru (kiriş) oluşturmak için iki
% noktaya ihtiyaç duyar.Grafikte kökün 1 ile 2 arasında olduğunu tahmin
% ederek bu değerleri verdik!!
x1= 2; % İkinci başlangıç noktası
hata_siniri = 0.0001;%Durma kriterimizdir. Eğer bulduğumuz yeni kök ile bir önceki 
% arasındaki fark bu sayıdan küçükse, 'Tamam, sonuca yeterince yaklaştık' deriz ve işlemi bitiririz.
for n = 1:50% Bu bir for döngüsüdür. Algoritmanın sonsuza kadar devam etmesini engeller. 
    % En fazla 50 adımda kökü bulmaya çalışırız.
    % Sekant Formülü (Türev gerektirmez!)
    x2=x1-(f(x1)*(x1-x0))/(f(x1)-f(x0));%Türev yerine, iki nokta arasındaki eğimi kullanan sekant formülü
    %x0 ve x1 noktalarından geçen doğrunun x eksenini kestiği yeni noktayı
    %x2 hesaplar.
    if abs(x2-x1)<hata_siniri %iki ardışık hata arasındaki fark bizim hata sınırımızdan küçükse istenen yakınlığa geldik
        break;
    end
    %Değişken Güncelleme (Bir sonraki adıma Hazırlık) 
    x0 = x1;% Görevi: Eski x0 değerini çöpe atar, yerini bir önceki adımın "yeni" değeri olan x1'i koyar.
    x1 = x2;% Görevi: En son hesapladığımız x2 değerini, bir sonraki adımda kullanmak üzere x1 değerine atarız.
end
fprintf('Sekant Yöntemi ile Kök: %.6f\n', x2);%virgülden sonra 6 basamak yazdır demektir:Hassasiyet