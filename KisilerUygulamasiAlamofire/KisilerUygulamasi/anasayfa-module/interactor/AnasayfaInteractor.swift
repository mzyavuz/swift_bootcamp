//
//  AnasayfaInteractor.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Cakmakci on 9.10.2022.
//

import Foundation
import Alamofire

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumKisilerAl() {
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php", method: .get).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let liste = cevap.kisiler {
                        self.anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    
    }
    
    func kisiAra(aramaKelimesi: String) {
        let params: Parameters = ["kisi_ad": aramaKelimesi]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let liste = cevap.kisiler {
                        self.anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func kisiSil(kisi_id: Int) {
        let params: Parameters = ["kisi_id": kisi_id]
        
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php", method: .post, parameters: params).response { response in
            if let data = response.data {
                do {
                    let cevap = try JSONSerialization.jsonObject(with: data)
                    print(cevap)
                    self.tumKisilerAl()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
