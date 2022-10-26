//
//  SepetInteractor.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 22.10.2022.
//

import Foundation

class SepetInteractor: PresenterToInteractorSepetProtocol {
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
    func sepettekiTumYemekleriAl(kullanici_adi: String) {
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php")!)
                
        istek.httpMethod = "POST"
        
        let postString = "kullanici_adi=\(kullanici_adi)"

        istek.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: istek) { data, response, error in
            do {
                let cevap = try JSONDecoder().decode(YemekCevap.self, from: data!)
                if let liste = cevap.sepet_yemekler {
                    let duzenlenmisListe = self.sepetListeDuzenleme(sepetListe: liste)
                    self.sepetPresenter?.presenteraVeriGonder(sepetYemekListe: duzenlenmisListe)
                }
            }catch{
                self.sepetPresenter?.presenteraVeriGonder(sepetYemekListe: [Yemek]())
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func sepettenYemekSil(sepet_yemek_id: String, kullanici_adi: String) {
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php")!)
              
              istek.httpMethod = "POST"
              
              let postString = "sepet_yemek_id=\(sepet_yemek_id)&kullanici_adi=\(kullanici_adi)"
              
              istek.httpBody = postString.data(using: .utf8) //encoding for turkish characters
              
              URLSession.shared.dataTask(with: istek) {data,response,error in
                  do {
                      let cevap = try JSONSerialization.jsonObject(with: data!)
                      self.sepettekiTumYemekleriAl(kullanici_adi: kullanici_adi)
                  }catch{
                      print(error.localizedDescription)
                  }
              }.resume()
    }
    
}

extension SepetInteractor {
    
    func tumSepetiSilme(sepetListe: [Yemek]) {
        for i in sepetListe {
            sepettenYemekSil(sepet_yemek_id: i.sepet_yemek_id!, kullanici_adi: i.kullanici_adi!)
        }
    }
    
    func sepetListeDuzenleme(sepetListe: [Yemek]) -> [Yemek] {
        var duzenlenmisListe = [Yemek]()
        let kullanici_adi = sepetListe.first!.kullanici_adi!
        for i in sepetListe {
            var sepetteVarMi = false
            for j in duzenlenmisListe {
                if (i.yemek_adi == j.yemek_adi) {
                    sepetteVarMi = true
                    j.yemek_siparis_adet =  String(Int(i.yemek_siparis_adet!)! + Int(j.yemek_siparis_adet!)!)
                    sepettenYemekSil(sepet_yemek_id: i.sepet_yemek_id!, kullanici_adi: kullanici_adi)
                    sepettenYemekSil(sepet_yemek_id: j.sepet_yemek_id!, kullanici_adi: kullanici_adi)
                    YemekDetayInteractor().yemekSepeteEkle(yemek: j, yemek_siparis_adet: j.yemek_siparis_adet!, kullanici_adi: kullanici_adi)
                    sepettekiTumYemekleriAl(kullanici_adi: kullanici_adi)
                    break
                }
            }
            if !sepetteVarMi {
                duzenlenmisListe.append(i)
            }
        }
        var sepet_ucret = 0
        for y in duzenlenmisListe {
            y.toplam_ucret = Int(y.yemek_fiyat!)! * Int(y.yemek_siparis_adet!)!
            sepet_ucret += y.toplam_ucret!
        }
        self.sepetPresenter?.presenteraToplamUcretiGonder(sepet_ucret: sepet_ucret)
        return duzenlenmisListe
    }
}

