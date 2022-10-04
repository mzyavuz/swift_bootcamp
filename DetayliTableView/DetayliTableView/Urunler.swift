//
//  Urunler.swift
//  DetayliTableView
//
//  Created by M.Zeynep Cakmakci on 4.10.2022.
//

import Foundation

class Urunler {
    var urunId: Int?
    var urunAd: String?
    var urunResimAd: String?
    var urunFiyat: Int?
    
    init(urunId: Int, urunAd: String, urunResimAd: String, urunFiyat: Int) {
        self.urunId = urunId
        self.urunAd = urunAd
        self.urunResimAd = urunResimAd
        self.urunFiyat = urunFiyat
    }
}
