import UIKit

/// Optional
/// Nullable - Null Safety
/// Neden : Uygulamanın çökme hatasının en büyük sebebi değişkenin null (nil) olması
///
/// ?:  , !:
/// ??: Varsayılan değer ataması

var mesaj = "Merhaba"

// nil = null (Diğer dillerdeki)
var str: String? = nil // ? koyarak nil değeri alabilir diyoruz - İdeal kullanım değil
var yazi:String? // üsttekinin idealı

yazi = "Hello"

print(yazi!) // Uygulama çökebilir ama print nill değerini gösterdi

if yazi != nil {
    print(yazi!) // Sonuna ünlem konunca istediğimiz değere ulaşmaya "unwrap" denir
} else {
    print("Yazi nil değer içeriyor")
}

// Optional Binding (if let yapısı (if var da olur))

if let temp = yazi {
    print(temp) // Otamatik olarak unwrapping olur
} else {
    print("Yazi nil değeri içeriyor")
}


if var temp = yazi {
    print(temp) // Otamatik olarak unwrapping olur
    temp = "How are you?"
    
} else {
    print("Yazi nil değeri içeriyor")
}

/// NESNE TABANLI PROGRAMLA (OOP)
/// Class oluşturup bir çok nesneleri bu sınıflardan oluşturmak
/// Class vs Structure kullanılabilir

class Araba { //Sınıfların baş harfleri büyük olmalı
    var renk:String?
    var hiz:Int?
    var calisiyorMu:Bool?
    // her arabanın değerleri farklı olabileceğinden optional tanımlamak daha iyi olur
    
    init() { // Constructor -> Sınıftan nesne oluşturulduğunda çalışır
        print("Boş constructor çalıştı")
        // Nesne oluşumunda ilk tetiklenen yapı
        // Dolusu da olabilir
    }
    
    /*init(renkx: String, hizx: Int, calisiyorMux: Bool) {
        renk = renkx
        hiz = hizx
        calisiyorMu = calisiyorMux
        print("Dolu constructor çalıştı")
    }*/
    
    init(renk: String, hiz: Int, calisiyorMu: Bool) {
        self.renk = renk //self. ile globaldeki renge dışardan gelen rengi ekledik
        self.hiz = hiz  // Shadowing -> aynı isimde değerin ötekini kapatması, olmasın diye self. yaptık
        self.calisiyorMu = calisiyorMu
        print("Dolu constructor çalıştı")
    }
    
    func calistir() { // Side effect : Bir fonksiyon sınıf değişkenlerini etkilemesi
        calisiyorMu = true
        hiz = 5
    }
    
    func durdur() {
        calisiyorMu = false
        hiz = 0
    }
    
    func hizlan(kacKM: Int) {
        hiz! += kacKM
    }
    
    func yavasla(kacKM: Int) {
        hiz! -= kacKM
    }
    
    func bilgiAl() {
        print("-----------------------")
        print("Renk : \(renk!)")
        print("Hız : \(hiz!)")
        print("Çalışıyor Mu : \(calisiyorMu!)")
    }
}

// Nesne oluşturma
var bmw = Araba() // Parantez ile o sınıftan bir nesne oluşturduğumuzu belirtiyoruz
// Boş constructor çalıştı (Araba() classını çağırdığımız için)

var bmw2 = Araba(renk: "Koyu Kırmızı", hiz: 100, calisiyorMu: true)

// Nesneye değer atama
bmw.renk = "Kırmızı"
bmw.hiz = 100
bmw.calisiyorMu = true

print("Renk : \(bmw.renk!)")
print("Hız : \(bmw.hiz!)")
print("Çalışıyor Mu : \(bmw.calisiyorMu!)")

bmw2.bilgiAl()
bmw.durdur()
bmw.bilgiAl()
bmw2.hizlan(kacKM: 100)
bmw2.bilgiAl()
bmw2.yavasla(kacKM: 50)
bmw2.bilgiAl()

var sahin = Araba()

sahin.renk = "Beyaz"
sahin.hiz = 0
sahin.calisiyorMu = false

print("Renk : \(sahin.renk!)")
print("Hız : \(sahin.hiz!)")
print("Çalışıyor Mu : \(sahin.calisiyorMu!)")

sahin.bilgiAl()
sahin.calistir()
sahin.bilgiAl()
sahin.hizlan(kacKM: 40)
sahin.bilgiAl()
sahin.yavasla(kacKM: 20)
sahin.bilgiAl()

/// Class vs Structure Farkı
/// Class'ın daha hafif ve daha performanslı hali ama özellik aktarma ve kalıtım gibi özellikler kullanılmıyor
/// Class referans tipidir, structure ise değer tipidir
/// Referans tipinde tanımlanmış değişkeni başka değere aktarınca yeni değerdeki parametreyi değiştirince eskisi de değişiyor (aynı hafızada tutuldukları için)
/// Değer tipinde her bir değişken için ayrı yer açılıyor yani kopyalama oluyor o yüzden performansı daha yüksek

/// FONKSİYONLAR
/// Değişkenlerle aynı isimlendirme (naming convertion) kurallarına sahip
///  Parametre ile dışardan değer alırsın, return varsa dönüştürelebilir olduğu anlamına gelir

class Fonksiyonlar {
    // Void : geri dönüş değeri olmayan
    func selamla() {
        let sonuc = "Merhaba Batuhan"
        print(sonuc)
        // Bu fonksiyonun görevi sadece çalışıp sonuc değerini terminale yansıtmak
    }
    
    //Return : Geri dönüş değeri olan
    func selamla1() -> String {
        let sonuc = "Merhaba Batuhan"
        return sonuc
    }
    
    func selamla2(isim: String) -> String {
        let sonuc = "Merhaba \(isim)"
        return sonuc
    }
    
    func toplama(sayi1:Int, sayi2:Int) -> Int {
        let toplam = sayi1 + sayi2
        return toplam
    }
    
    func carpma(sayi1: Int, sayi2: Int) {
        print("Çarpma: \(sayi1 * sayi2)")
    }
    
    // Overloading
    func carpma(sayi1: Double, sayi2: Double) {
        print("Çarpma: \(sayi1 * sayi2)")
    }
    
    func carpma(sayi1: Int, sayi2: Int, isim:String) {
        print("Çarpma: \(sayi1 * sayi2) - İşlemi Yapan: \(isim)")
    }
}

let f = Fonksiyonlar()
f.selamla()

let gelenSonuc = f.selamla1()
print("Gelen Sonuc: \(gelenSonuc)")

let gelenSonuc2 = f.selamla2(isim: "Zeynep")
print("Gelen Sonuc 2: \(gelenSonuc2)")

let gelenToplam = f.toplama(sayi1: 10, sayi2: 20)
print("Gelen Toplam: \(gelenToplam)")

f.carpma(sayi1: 10, sayi2: 2)
f.carpma(sayi1: 4, sayi2: 6, isim: "Batuhan")


/// IMPORT
/// kütüphane özelliklerini kullanmak için import "PaketAdı" dememiz

/// Static Değişkenler ve Metodlar
/// Çok sık kullanılan ve pratiklik sağlıyacaklar yerlerde kullanılabilir

// Static (Kotlin: companion object)

class ASinifi {
    static var x = 10
    
    static func metod() {
        print("Metod çalıştı")
    }
    
}

/*
let a = ASinifi() // staticler eklenince parantezli olarak kullanılamıyor artık

print(a.x)
print(ASinifi().x) // Sanal nesne
ASinifi().metod() // Virtual object : Sanal nesne (yani ismi yok ama ayrı bir nesne olarak hafızada tanımlı
// ASinifi()'nın çok kullanınca hafızada çok yer harcar
*/


print(ASinifi.x) // Sanal nesne
ASinifi.metod()


/// ENUM (enumeration)
/// match yani eşleştirme özelinde çalışıyor

enum KonserveBoyut {
    case kucuk
    case orta
    case buyuk
}

func ucretHesapla(boyut: KonserveBoyut, adet: Int) {
    switch boyut {
        case .kucuk: print("Fiyat: \(adet * 13) ₺")
        case .orta: print("Fiyat: \(adet * 23) ₺")
        case .buyuk: print("Fiyat: \(adet * 33) ₺")
    }
}

ucretHesapla(boyut: .kucuk, adet: 10)

/// COMPOSITION
///  Çoğunlukla veritabanı modellemede kullanılıyor
///  Foreign Key -> Başka bir yerdeki key'i öteki tabloya gönderme
///  Bir sınıf içinde başka sınıftan bir nesne kullanmaya Composition denir

class Kategoriler {
    var kategori_id: Int?
    var kategori_ad: String?
    
    init(kategori_id:Int, kategori_ad:String) {
        //Shadowing
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
    }
}

class Yonetmenler {
    var yonetmen_id: Int?
    var yonetmen_ad: String?
    
    init(yonetmen_id:Int, yonetmen_ad:String) {
        //Shadowing
        self.yonetmen_id = yonetmen_id
        self.yonetmen_ad = yonetmen_ad
    }
}

class Filmler {
    var film_id: Int?
    var film_ad: String?
    var film_yil: Int?
    var kategori: Kategoriler? // Composition
    var yonetmen: Yonetmenler? // Composition
    
    init(film_id: Int, film_ad: String?, film_yil: Int?, kategori: Kategoriler, yonetmen: Yonetmenler) {
        self.film_id = film_id
        self.film_ad = film_ad
        self.film_yil = film_yil
        self.kategori = kategori
        self.yonetmen = yonetmen
    }
}

let k1 = Kategoriler(kategori_id: 1, kategori_ad: "Dram")
let k2 = Kategoriler(kategori_id: 2, kategori_ad: "Bilim Kurgu")

let y1 = Yonetmenler(yonetmen_id: 1, yonetmen_ad: "Quentin Tarantino")
let y2 = Yonetmenler(yonetmen_id: 2, yonetmen_ad: "Christopher Nolan")

let f1 = Filmler(film_id: 1, film_ad: "Interstellar", film_yil: 2013, kategori: k2, yonetmen: y2)

print("Film id: \(f1.film_id!)")
print("Film ad: \(f1.film_ad!)")
print("Film yıl: \(f1.film_yil!)")
print("Film kategori: \(f1.kategori!.kategori_ad!)") //Composition
print("Film yönetmen: \(f1.yonetmen!.yonetmen_ad!)") //Composition

/// INHERITANCE (Kalıtım)
/// class Araba:Arac {} (SuperClass: Araç -> SubClass: Araba)
/// override: Metodları tekrar yapılanması
///  override olması için kalıtım olmak zorunda

class Ev {
    var pencereSayisi: Int?
    
    init(pencereSayisi: Int?) {
        self.pencereSayisi = pencereSayisi
    }
}

class Villa : Ev {
    var garajVarMi: Bool?
    
    init(garajVarMi: Bool, pencereSayisi: Int) {
        self.garajVarMi = garajVarMi
        super.init(pencereSayisi: pencereSayisi)
    }
}

class Saray : Ev {
    var kuleSayisi: Int?
    
    init(kuleSayisi: Int, pencereSayisi: Int) {
        self.kuleSayisi = kuleSayisi
        super.init(pencereSayisi: pencereSayisi)
    }
}


var topkapiSarayi = Saray(kuleSayisi: 5, pencereSayisi: 300)
var bogazVilla = Villa(garajVarMi: true, pencereSayisi: 30)

print(topkapiSarayi.kuleSayisi!)
print(topkapiSarayi.pencereSayisi!)

print(bogazVilla.garajVarMi!)
print(bogazVilla.pencereSayisi!)

// Override Kullanımı

class Hayvan {
    func sesCikar() {
        print("Sesim Yok")
    }
}

class Memeli : Hayvan {
    // Override olmadığı için üst sınıfın özelliği çalışır
}

class Kedi : Memeli {
    override func sesCikar() {
        print("Miyav miyav")
    }
}

class Kopek : Memeli {
    override func sesCikar() {
        print("Hav Hav")
    }
}

var hayvan = Hayvan()
var memeli = Memeli()
var kedi = Kedi()
var kopek = Kopek()

hayvan.sesCikar() // Kalıtım olmadan kendi metoduna erişim sağladı
memeli.sesCikar() // Kalıtım yoluyla kendisinde metod olmadığı için (Override olmadığı için) üst sınıfın özelliği çalışır
kedi.sesCikar() // Kalıtım yoluyla tekrar kullanılan (override) kendi metodlarıyla çalıştı
kopek.sesCikar() // Kalıtım yoluyla tekrar kullanılan (override) kendi metodlarıyla çalıştı

