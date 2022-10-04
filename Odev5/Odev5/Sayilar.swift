//
//  Sayilar.swift
//  Odev5
//
//  Created by M.Zeynep Cakmakci on 3.10.2022.
//

import Foundation
import UIKit


protocol MyProtocol {
    
    func topla(ilkSayiMi: Bool, ilkSayi: Int?) -> Int
}

extension Int {
    func topla(sayi: Int) -> Int {
        return self + sayi
    }
}


class Sayilar : UIButton, MyProtocol {
    
    var degisken: Int?
    
    func topla(ilkSayiMi: Bool, ilkSayi: Int?) -> Int {
        var sonuc: Int?
        if ilkSayiMi == false {
            sonuc = ilkSayi!.topla(sayi: degisken!)
        } else {
            sonuc = degisken
        
        }
        return sonuc!
    }

}




