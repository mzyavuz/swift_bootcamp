//
//  Filmler.swift
//  DetayliCollectionView
//
//  Created by M.Zeynep Cakmakci on 4.10.2022.
//

import Foundation

class Filmler {
    var filmId: Int?
    var filmAdi: String?
    var filmResimAdi: String?
    var filmYonetmenAdi: String?
    var filmFiyat: Int?
    
    init(filmId: Int, filmAdi: String, filmResimAdi: String, filmYonetmenAdi: String, filmFiyat: Int) {
        self.filmId = filmId
        self.filmAdi = filmAdi
        self.filmResimAdi = filmResimAdi
        self.filmYonetmenAdi = filmYonetmenAdi
        self.filmFiyat = filmFiyat
    }
}
