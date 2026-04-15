%Bolzano Teoremine Göre Kök İçeren Aralığı Belirleme
%f(x_sol) * f(x_sag) > 0 olduğu sürece, bu iki değer aynı işaretli demektir. (-*-=+ or +*+=+) 
% (ikisi de artı veya ikisi de eksi). Bu durumda aralarında kök olmayabilir.
%Kaydırma İşlemi: Eğer kök yoksa, aralığı bir adım (h kadar) sağa kaydırıyoruz. 
%Sol ucu eski sağ uca getiriyoruz, sağ ucu ise h kadar artırıyoruz.
%Girdiler kulllanıcıdan alınıyor.
clc; clear;
f = input('Fonksiyonu giriniz (Örn: @(x) x^3 - x - 2): ');
x0 = input('Başlangıç noktasını (x0) giriniz: ');
h = input('Adım uzunluğunu (h) giriniz: ');
x_sol = x0;
x_sag = x0 + h;
% Durum: f(x_sol) ve f(x_sag) zıt işaretli olana kadar ilerle
% Yani çarpımları pozitif olduğu sürece döngü devam etsin
while f(x_sol) * f(x_sag) > 0
    x_sol = x_sag;        % Eski sağ noktayı sol yap
    x_sag = x_sag + h;    % Yeni bir sağ nokta belirle
    % Sonsuz döngüye girmemesi için bir limit koyulabilir (Opsiyonel)
    if x_sag > x0 + 1000
        fprintf('Belirlenen sınırda kök bulunamadı.\n');
        return;
    end
end
fprintf('Kök [%f, %f] aralığındadır.\n', x_sol, x_sag);
fprintf('f(%f) = %f, f(%f) = %f\n', x_sol, f(x_sol), x_sag, f(x_sag));