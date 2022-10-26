//
//  UcretHesap.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 24.10.2022.
//

import Foundation

class UcretHesap {
    
    func siparisHesap(yemek: Yemek) -> Int {
        yemek.toplam_ucret = Int(yemek.yemek_fiyat!)! * Int(yemek.yemek_siparis_adet!)!
        return yemek.toplam_ucret!
    }
}
