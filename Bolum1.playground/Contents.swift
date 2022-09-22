import UIKit

print("Merhaba Dünya")

//Değişkenler kalıcı değildir, çalıştırmaya basarız çalışır işlem biter sonra çalışmasını durdurur.

// iki nokta üst üste ":" : atama (delegate) özellik aktarma

// Tam Sayılar - Int: Tam sayılar , UInt: Doğal sayılar (0 ve pozitif)
// Ondalıklı sayılar - double ve float
// Metinsel ifadeler -  String: yazılar, Character: Harfler
// Mantıksal İfadeler -  Bool: True veya False

// Literals - Değerlerin Yazılma Kuralları

// "Ahmet" - String
// 18 - Int
// 1.78 - Double
// "A" - Character

// Değişkenlere isim verme
// - Case sensitive'dir (Büyük harf ve küçük harf farkı)
// - Rakamla başlayamaz
// - @,$ ve % kullanılmaz

// NAming Convention
// Camel Case: movieName, Snake Case (veritabanı modellerinde kullanılan): movie_name

// White Space - Beyaz boşluk : Swift ifadeler arasında boşluk istiyor

var ogrenciAdi = "Ahmet"
var ogrenciYas = 18
var ogrenciBoy = 1.78
var ogrenciBasHarf = "A"
var ogrenciDevamEdiyorMu = true

print(ogrenciAdi)
print(ogrenciYas)
print(ogrenciBoy)
print(ogrenciBasHarf)
print(ogrenciDevamEdiyorMu)

var urun_id:Int = 3416
var urun_adi:String = "Rolex"
var urun_adet:Int = 100
var urun_tedarikci:String = "Rolex"
var urun_fiyat:Double = 149.99

print("Ürün id: \(urun_id)")
print("Ürün adı: \(urun_adi)")
print("Ürün adet: \(urun_adet)")
print("Ürün tedarikçi: \(urun_tedarikci)")
print("Ürün fiyat: \(urun_fiyat) ₺")

// Constant - Sabitler, Kotlin: val; Java,Dart: final
var sayi = 10
print(sayi)

sayi = 20
print(sayi)

// let : Dart'taki const değiştirilemeyen sabit

let numara = 100
print(numara)

// !HATA! numara = 50

// Amaç performansı iyileştirmek
// var da daha esnek bir depolama alanı açıyor, let ise değişmediğinden net bir alan kaplıyor


/// TÜR DÖNÜŞÜMLER
// *Int(), Float(), Double(), String()

// Kullanıcıdan çekilen ve arayüze yazılacak olan her veri STRİNG olmak ZORUNDA

// 1) Sayısaldan Sayısala
var i = 42
var d = 56.78

var sonuc1 = Double(i)
var sonuc2 = Int(d)

print(sonuc1) // 42 -> 42.0 artık double olarak yer alıyor
print(sonuc2) // Noktalı kısmı uçurdu, yuvarlaMAdı

// 2) Sayısaldan Metine (Hata ihtimali en düşük olan case)
var sonuc3 = String(i)
var sonuc4 = String(d)

print(sonuc3)
print(sonuc4)

// 3) Metinden Sayısala
var yazi = "34"

// var sonuc5 = Int(yazi) --> Eğer int olmayan ifade varsa nill dönüyor

if let sonuc5 = Int(yazi) {
    print(sonuc5)
} else {
    print("Dönüşüm hatası")
}

/// TUPLES
//Tuples (değişkenle dizi arasında bir yapı) -> ()
var kisi = ("Ahmet", "Aksoy")

var ad = kisi.0
var soyad = kisi.1

print(ad)
print(soyad)

var koordinat = (x:10, y:20) //Map yapısına benziyor

print(koordinat.x)
print(koordinat.y)

var hataMesajı = (404, "Not Found")
var (kod,mesaj) = hataMesajı // 404=kod, mesaj=Not Found

print(kod)
print(mesaj)

/// KARŞILAŞTIRMA OPERATÖRLERİ
var x1 = 60
var x2 = 50

var y1 = 70
var y2 = 80

print(x1 == x2) // false
print(x1 != x2) // true

print(x1 > x2) // true
print(x1 < x2) // false

print(x1 >= x2) // true
print(x1 <= x2) // false

print(x1>x2 || y1>y2) // OR (veya) F-F:F ötekiler:T
print(x1>x2 && y1>y2) // AND (ve) T-T:T ötekiler:F

/// IF YAPISI
var yas = 17
var isim = "Mehmetx"

if yas >= 18 {
    print("\(isim) reşittir")
} else {
    print("\(isim) reşit değildir")
}

if isim == "Ahmet" {
    print("Merhaba Ahmet")
} else if isim == "Mehmet" {
    print("Merhaba Mehmet")
} else {
    print("Tanınmayan kişi")
}


var ka = "admin"
var s = 123456

if ka == "admin" && s == 12345 {
    print("Hoşgeldiniz")
} else {
    print("Hatalı giriş")
}


var sonuc = 8

if sonuc == 9 || sonuc == 10 {
    print("Sonuc 9 veya 10 dur")
} else {
    print("Sonuç 9 veya 10 değildir")
}

/// SWITCH YAPISI (Kotlin: when, bir çok diğer dilde: switch

var gun = 3

switch gun {
    case 1: print("Pazartesi")
    case 2: print("Salı")
    case 3: print("Çarşamba")
    case 4: print("Perşembe")
    case 5: print("Cuma")
    case 6: print("Cumartesi")
    case 7: print("Pazar")
    default: print("Böyle bir gün yok")
}

/// FOR Döngüsü
/// Başlangıç ve bitiş vakti belli

//1,2,3
// for each döngüsünün evrilmiş hali (kotlin : 1..3)
for x in 1...3 { // Eğer x değerini kullanmayacaksan "_" de koyabilirisn x yerine
    print("Döngü 1 : \(x)")
}

//10 ile 20, 5er artış
for y in stride(from: 10, through: 20, by: 5) { //to da ise son eleman alınmaz
    print("Döngü 2 : \(y)")
}

//20 ile 10, 5er azalış
for y in stride(from: 20, through: 10, by: -5) { //to da ise son eleman alınmaz
    print("Döngü 3 : \(y)")
}


/// WHILE Döngüsü
/// Biraz if döngüsü gibi

//1,2,3
var sayac = 1
while sayac < 4 {
    print("Döngü 4 : \(sayac)")
    sayac+=1//sayac = sayac +1
}

//Döngülerde Break ve Continue

for i in 1...5 {
    if i == 3 {
        break
    }
    print("Döngü 5 : \(i)")
}

for i in 1...5 {
    if i == 3 {
        continue
    }
    print("Döngü 6 : \(i)")
}

