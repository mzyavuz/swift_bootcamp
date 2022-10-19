//
//  KİsiKayitInteractor.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Cakmakci on 9.10.2022.
//

import Foundation

class KisiKayitInteractor: PresenterToInteractorKisiKayitProtocol {
    func kisiEkle(kisi_ad: String, kisi_tel: String) {
        //POST
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!)
        
        istek.httpMethod = "POST"
        
        let postString = "kisi_ad=\(kisi_ad)&kisi_tel=\(kisi_tel)"
        
        istek.httpBody = postString.data(using: .utf8) //encoding for turkish characters
        
        URLSession.shared.dataTask(with: istek) {data,response,error in
            do {
                let cevap = try JSONSerialization.jsonObject(with: data!)
                print(cevap)
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}
