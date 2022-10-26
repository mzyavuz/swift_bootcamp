//
//  ResimFunction.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 22.10.2022.
//

import Foundation
import UIKit
import Kingfisher

class ResimFunction {
    
    func resimYukle(yemek: Yemek, imageView: UIImageView!) {
        let resimUrl = "http://kasimadalan.pe.hu/yemekler/resimler/"
        let imageUrl = resimUrl + yemek.yemek_resim_adi!
        if let url = URL(string: imageUrl) {
            DispatchQueue.main.async {
                imageView.kf.setImage(with: url) //kingfisher nesnesi
            }
        }
    }
}
