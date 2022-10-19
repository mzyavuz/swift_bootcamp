//
//  AnasayfaInteractor.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Cakmakci on 9.10.2022.
//

import Foundation

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumKisilerAl() {
        //GET
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data!)
                if let liste = cevap.kisiler {
                    self.anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func kisiAra(aramaKelimesi: String) {
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!)
        
        istek.httpMethod = "POST"
        
        let postString = "kisi_ad=\(aramaKelimesi)"
        
        istek.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: istek) { data, response, error in
            do {
                let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data!)
                if let liste = cevap.kisiler {
                    self.anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func kisiSil(kisi_id: String) {
        //POST
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!)
        
        istek.httpMethod = "POST"
        
        let postString = "kisi_id=\(kisi_id)"
        
        istek.httpBody = postString.data(using: .utf8) //encoding for turkish characters
        
        URLSession.shared.dataTask(with: istek) {data,response,error in
            do {
                let cevap = try JSONSerialization.jsonObject(with: data!)
                print(cevap)
                self.tumKisilerAl()
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}
