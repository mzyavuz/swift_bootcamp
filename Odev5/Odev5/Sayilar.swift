//
//  Sayilar.swift
//  Odev5
//
//  Created by M.Zeynep Cakmakci on 3.10.2022.
//

import Foundation
import UIKit


protocol MyProtocol {
    
    func sayiVarIslem(ilkSayi: Int?) -> Int
    func sayiYokIslem() -> Int
}

extension Int {
    func topla(sayi: Int) -> Int {
        return self + sayi
    }
}


class Sayilar : UIButton, MyProtocol {
    
    var degisken: Int?
    
    func sayiVarIslem(ilkSayi: Int?) -> Int {
        return ilkSayi! * 10 + degisken!
    }
    
    func sayiYokIslem() -> Int {
        return degisken!
    }

}




