//
//  YemekDetayInteractor.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 22.10.2022.
//

import Foundation

class YemekDetayInteractor: PresenterToInteractorYemekDetayProtocol {
    
    func yemekSepeteEkle(yemek: Yemek ,yemek_siparis_adet: String, kullanici_adi: String) {
        
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php")!)
        
        istek.httpMethod = "POST"
        
        let postString = "yemek_adi=\(yemek.yemek_adi!)&yemek_resim_adi=\(yemek.yemek_resim_adi!)&yemek_fiyat=\(yemek.yemek_fiyat!)&yemek_siparis_adet=\(yemek_siparis_adet)&kullanici_adi=\(kullanici_adi)"
        
        istek.httpBody = postString.data(using: .utf8) //encoding for turkish characters
        
        URLSession.shared.dataTask(with: istek) {data,response,error in
            do {
                let cevap = try JSONSerialization.jsonObject(with: data!)
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
        
    }
    
}


