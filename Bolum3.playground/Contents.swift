import UIKit

/// COLLECTIONS
/// Array, Set ve Dictionary(Map)

// Array Kullanımı
// Tanımlama

var numaralar = [10,20,30]
var meyveler = [String]()

// Veri ekleme
meyveler.append("Elma")
meyveler.append("Muz")
meyveler.append("Kiraz")

print(meyveler)

// Güncelleme
meyveler[0] = "Apple"
print(meyveler[0])

// Insert
meyveler.insert("Portakal", at: 1) // 1.İndex ten sonrakileri kaydı
print(meyveler)

// Veri okuma
let m = meyveler[2]
print("2.indeks: \(m)")


print(meyveler.isEmpty) // Boş mu? Hayır değil
print(meyveler.count) // Eleman sayısı
print(meyveler.first!) // İlk eleman
print(meyveler.last!) // Son eleman
print(meyveler.firstIndex(of: "Muz")!)
print(meyveler.contains("Muz"))

for meyve in meyveler {
    print("Sonuc 1: \(meyve)")
}

for (indexMi, meyve) in meyveler.enumerated() { //Kotlin: withIndex
    print("\(indexMi). -> \(meyve)")
}

meyveler.remove(at: 1) // 1.index'teki eleman silinecek
meyveler.removeAll() // Bütün elemanları siler

// Array Nesne Tabanlı Kullanımı
class Urunler {
    var id: Int?
    var ad: String?
    var fiyat: Int?
    
    init(id: Int?, ad: String?, fiyat: Int?) {
        self.id = id
        self.ad = ad
        self.fiyat = fiyat
    }
}

var u1 = Urunler(id: 1, ad: "TV", fiyat: 7000)
var u2 = Urunler(id: 2, ad: "Bilgisayar", fiyat: 15000)
var u3 = Urunler(id: 3, ad: "Kulaklık", fiyat: 1000)

var urunlerListesi = [Urunler]()
urunlerListesi.append(u1)
urunlerListesi.append(u2)
urunlerListesi.append(u3)

for u in urunlerListesi {
    print("Id: \(u.id!) - Ad: \(u.ad!) - Fiyat: \(u.fiyat!) ₺")
}

// Filtreleme
var f1 = urunlerListesi.filter({
    // Bütün ürünler geliyor, sen filtreleyeceksin
    $0.fiyat! > 5000 //$0 ürün nesnesini temsil eder
    &&
    $0.fiyat! < 10000
})
print("Filtreleme 1")
for u in f1 {
    print("Id: \(u.id!) - Ad: \(u.ad!) - Fiyat: \(u.fiyat!) ₺")
}

var f2 = urunlerListesi.filter({
    $0.ad!.contains("l")
})
print("Filtreleme 2")
for u in f2 {
    print("Id: \(u.id!) - Ad: \(u.ad!) - Fiyat: \(u.fiyat!) ₺")
}

// Sort - Sıralama
var s1 = urunlerListesi.sorted(by: {
    $0.fiyat! > $1.fiyat!
})
print("Fiyata göre azalan")
for u in s1 {
    print("Id: \(u.id!) - Ad: \(u.ad!) - Fiyat: \(u.fiyat!) ₺")
}

var s2 = urunlerListesi.sorted(by: {
    $0.fiyat! < $1.fiyat!
})
print("Fiyata göre artan")
for u in s2 {
    print("Id: \(u.id!) - Ad: \(u.ad!) - Fiyat: \(u.fiyat!) ₺")
}

var s3 = urunlerListesi.sorted(by: {
    $0.ad! > $1.ad!
})
print("Adına göre azalan")
for u in s3 {
    print("Id: \(u.id!) - Ad: \(u.ad!) - Fiyat: \(u.fiyat!) ₺")
}

var s4 = urunlerListesi.sorted(by: {
    $0.ad! < $1.ad!
})
print("Adına göre artan")
for u in s4 {
    print("Id: \(u.id!) - Ad: \(u.ad!) - Fiyat: \(u.fiyat!) ₺")
}


// Set Kullanımı
var meyveler1 = Set<String>()

// Veri ekleme
meyveler1.insert("Elma")
meyveler1.insert("Portakal")
meyveler1.insert("Muz")
print(meyveler1)

meyveler1.insert("Amasya Elması")
print(meyveler1)

for meyve in meyveler1 {
    print("Sonuç : \(meyve)")
}

for (i,m) in meyveler1.enumerated() {
    print("\(i). -> \(m)")
}

print(meyveler1.count)
meyveler1.remove("Muz")
print(meyveler1)

var index = meyveler1.firstIndex(of: "Elma")
meyveler1.remove(at: index!)
print(meyveler1)

meyveler1.removeAll()
print(meyveler1)

// Dictionary - Map
// JSON

var iller = [Int:String]()

// Veri Ekleme
iller[16] = "BURSA"
iller[34] = "İSTANBUL"

print(iller)

// Veri Okuma
print(iller[34]!)

// Veri Güncelleme
iller[16] = "YENİ BURSA"
print(iller)

for (anahtar, deger) in iller {
    print("\(anahtar) -> \(deger)")
}

iller.removeValue(forKey: 16)
print(iller)


/// GUARD kullanımı
/// if'in tersi: if trueyi çalıştırırken guard elsi takip eder, false ise çalışır
/// Fonksiyon içinde kullanılır

func kisiTanimaIf(ad: String) {
    if ad == "Ahmet" {
        print("Merhaba Ahmet")
    } else {
        print("Tanınmayan kişi")
    }
}

kisiTanimaIf(ad: "Ahmet")

func kisiTanimaGuard(ad: String) {
    guard ad == "Ahmet" else { //else kullanmak zorunlu
        print("Tanınmayan kişi")
        return
    }

    print("Merhaba Ahmet")
}

kisiTanimaGuard(ad: "Ahmetx")
// Guardın amacı kodlamaları daha sade hale getirmek, Olumsuz olduğu yerlerde çok kullanışlı (if den çok else fazla ise)


/// Hata Ayıklama (try - catch)
/// 1.Derleme Hatası (Compile Error)
let c = 3
//c = "Elma" // Çalıştırmadan karşımıza çıkar, açıklamalar ile çözmeye çalışırız

/// 2.Hata (RunTime Exception)
/// Çalışma Sırasında Uygulamayı Çökerten
let sonuc = 10 / c // 0 a bölme
print(sonuc)

enum Hatalar: Error {
    case sifiraBolunmeHatasi
}

func bolme(sayi1: Int, sayi2: Int) throws -> Int { // Zoraki try yazdırma
    if sayi2 == 0 {
        throw Hatalar.sifiraBolunmeHatasi
    }
    return sayi1 / sayi2
}

do {
    let sonuc = try bolme(sayi1: 10, sayi2: 0) //try yazmayı unutma
    print(sonuc)
} catch Hatalar.sifiraBolunmeHatasi {
    print("Sayı sıfıra bölünemez")
}

let sonuc1 = try? bolme(sayi1: 8, sayi2: 0)

if let temp = sonuc1 {
    print(temp)
} else {
    print("Sayı sıfıra bölünemez")
}
