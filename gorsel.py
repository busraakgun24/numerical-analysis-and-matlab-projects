import cv2#Opencv kütüphanesi programa dahile ediliyor. Görüntüyü okumak ve yeniden
# boyutlandırmak içiin kullanılır
import matplotlib.pyplot as plt #Görselleri ekranda ekranda tutmak için kullanılır.
# Kısaca plt olarak çağırılabilir
# Resmi oku
img = cv2.imread("kedi.png")
if img is None:#Dosya bulunamazsa kısaca uyarı verir. Boş görüntü ile işlem yapamayız.
    print("Resim okunamadı. Dosya adını ve klasörü kontrol et.")
    exit()
# OpenCV BGR sırasıyla (Blue-Green-Red) okur, matplotlib RGB(Red-Green-Blue) ister
img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)#Renkler doğru görünsün diye dönüşüm yapar.
# Fark daha net görünsün diye 6 kat büyütüyoruz
scale = 6
nearest = cv2.resize(img_rgb, None, fx=scale, fy=scale,
                     interpolation=cv2.INTER_NEAREST)#görüntü en yakın komşu yöntemiyle büyütülür.
#En yakın piksel değeri kopyalanır. Sonuç daha bloklu ve pikselli görünür.

bilinear = cv2.resize(img_rgb, None, fx=scale, fy=scale,
                      interpolation=cv2.INTER_LINEAR)#Görüntü Bilineer interpolasyon ile bütyütülür.
#Komşu piksellerden ara değer hesaplar. Sonuç yumuşak ama biraz bulanık olur.

bicubic = cv2.resize(img_rgb, None, fx=scale, fy=scale,
                     interpolation=cv2.INTER_CUBIC)#Görüntü bikübik interpolasyon ile büyütülür.
#Daha fazla komşu pikseli hesaba katar. Genellikle daha yumuşak ve daha dengeli sonuç verir.

# 4 resmi aynı pencerede gösterecek.
images = [img_rgb, nearest, bilinear, bicubic]
titles = ["Original", "Nearest Neighbor", "Bilinear", "Bicubic"]# Başlıklar listeleniyor.

plt.figure(figsize=(12, 6))#Açılacak grafik penceresinin boyutunu ayarlar.

for i in range(4):
    plt.subplot(2, 2, i + 1)#2x2 düzeninde gösterir. 
    plt.imshow(images[i])
    plt.title(titles[i])#Her birine başlık ekler.
    plt.axis("off")#pencere kapatılır.

plt.tight_layout()#Görsellerin düzgün yerleşmesini sağlar
plt.show()#Pencereyi ekrana getirir.