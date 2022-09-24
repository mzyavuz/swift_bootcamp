import UIKit

class Odev2 {

  // 1
    func toFahrenheit(celciusDerece: Double) -> Double {
        var fahrenheitDerece = 0.0
        if celciusDerece >= -273.0 && celciusDerece <= 100.0  {
                fahrenheitDerece = (celciusDerece * 1.8) + 32.0
            } else {
              print("Lütfen '-273' ile '100' aralığında bir sayı giriniz")
            }
        return fahrenheitDerece
    }

  // 2
    func dikdortgenCevresiHesapla(kenar1: Double, kenar2: Double) {
        if kenar1 > 0.0 && kenar2 > 0.0 {
            var dikdortgenCevresi = 2.0 * (kenar1 + kenar2)
            print(dikdortgenCevresi)
        } else {
          print("Lütfen pozitif değerler giriniz.")
        }
  }

  // 3
    func faktoriyel(sayi: Int) -> Int {
        if sayi == 0 {
          return 1
        } else if sayi > 1 {
            var sonuc = sayi
            var s = sayi
              while s > 1 {
                sonuc *= (s-1)
                s -= 1
              }
            return sonuc
        } else {
          print("Lütfen doğal sayı giriniz!")
          return 0
        }
  }

  //4
    func kacTaneVar(kelime: String, harf: String) {
        var toplamSayi = 0
        for character in kelime {
            if String(character) == harf {
                toplamSayi += 1
            }
        }
        print(toplamSayi)
  }

  //5
    func icAcilarToplami(kenarSayisi: Int) -> Int {
    if kenarSayisi > 0 {
      var icAci = (kenarSayisi - 2) * 180
      return icAci
    } else {
      print("Lütfen bir doğal sayı giriniz.")
      return 0
    }

  }

  //6
    func maasHesabi(calisilanGun: Double) -> Double {
        var maas = 0.0
        if calisilanGun > 31 {
          print("Lütfen 31'den az doğal sayi giriniz");
        } else if calisilanGun > 20.0 {
            maas = (20.0*80.0) + ((calisilanGun-20.0) * 160.0)
        } else if calisilanGun <= 20.0 {
            maas = calisilanGun * 80.0
        } else {
          print("Lütfen bir doğal sayı giriniz.");
        }
        return maas
  }

  //7
    func internetUcreti(toplamGB: Int) -> Int {
        var ucret = 100
        if toplamGB > 50 {
          ucret = 100 + ((toplamGB - 50) * 4)
        }
        return ucret
  }
}

var o = Odev2()

print(o.toFahrenheit(celciusDerece: 100.0))

o.dikdortgenCevresiHesapla(kenar1: 10.0, kenar2: 25.0)

print(o.faktoriyel(sayi: 6))

o.kacTaneVar(kelime: "haydarpaşa", harf: "a")

print(o.icAcilarToplami(kenarSayisi: 9))

print(o.maasHesabi(calisilanGun: 32))

print(o.internetUcreti(toplamGB: 40))
