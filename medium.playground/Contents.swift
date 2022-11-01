import UIKit

protocol UcakProtocol {
    var ucakKapasiteSayisi: Int { get set }
    var ucakPilotSayisi: Int { get }
    
    func ucakCalıstır()
    func ucusSeviyeHesapla(altimetre: Int) -> String
}

struct GenisGovdeliUcakStructure: UcakProtocol {
    var ucakKapasiteSayisi: Int
    
    var ucakPilotSayisi: Int
    
    func ucakCalıstır() {
        print("Uçak Çalıştırıldı")
    }
    func ucusSeviyeHesapla(altimetre: Int) -> String {
        var seviye = altimetre / 100
        var ucusSeviye = "FL\(seviye)"
        return ucusSeviye
    }
    
}

let A380 = GenisGovdeliUcakStructure(ucakKapasiteSayisi: 480, ucakPilotSayisi: 2)


print(A380.ucusSeviyeHesapla(altimetre: 45600))

