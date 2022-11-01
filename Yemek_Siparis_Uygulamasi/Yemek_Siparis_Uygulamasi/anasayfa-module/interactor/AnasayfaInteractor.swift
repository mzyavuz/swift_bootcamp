//
//  AnasayfaInteractor.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 22.10.2022.
//

import Foundation

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumYemekleriAl() {
        //GET
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                let cevap = try JSONDecoder().decode(YemekCevap.self, from: data!)
                if let liste = cevap.yemekler {
                    self.anasayfaPresenter?.presenteraVeriGonder(yemekListe: liste)
                }
            }catch{
                print(String(describing: error))
            }
        }.resume()
    }
    
    func yemekAra(aramaKelimesi: String) {
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                let cevap = try JSONDecoder().decode(YemekCevap.self, from: data!)
                if let liste = cevap.yemekler {
                    let aramaListesi = self.arama_islemi(aramaKelimesi: aramaKelimesi, yemekListesi: liste)
                    self.anasayfaPresenter?.presenteraVeriGonder(yemekListe: aramaListesi)
                }
            }catch{
                print(String(describing: error))
            }
        }.resume()
    }
    
}

extension AnasayfaInteractor {
    func arama_islemi(aramaKelimesi: String, yemekListesi: [Yemek]) -> [Yemek] {
        var aramaListesi = [Yemek]()
        for yemek in yemekListesi {
            if yemek.yemek_adi!.lowercased().contains(aramaKelimesi.lowercased()) {
                aramaListesi.append(yemek)
            }
        }
        return aramaListesi
    }
}
