//
//  YemekCollectionViewHucre.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 22.10.2022.
//

import UIKit

protocol HucreProtocol {
    func buttonaTiklandi(indexPath: IndexPath)
}

class YemekCollectionViewHucre: UICollectionViewCell {
    @IBOutlet weak var yemekResim: UIImageView!
    @IBOutlet weak var yemekAdLabel: UILabel!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    
    var hucreProtocol: HucreProtocol?
    var indexPath: IndexPath?
    
    
    
}
