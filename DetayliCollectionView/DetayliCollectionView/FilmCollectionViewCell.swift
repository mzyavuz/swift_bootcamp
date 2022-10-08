//
//  FilmCollectionViewCell.swift
//  DetayliCollectionView
//
//  Created by M.Zeynep Cakmakci on 4.10.2022.
//

import UIKit

protocol HucreProtocol {
    func buttonaTiklandi(indexPath: IndexPath)
}

class FilmCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var filmAdiLabel: UILabel!
    @IBOutlet weak var filmImagaView: UIImageView!
    @IBOutlet weak var filmFiyatLabel: UILabel!
    
    // Butona tıklandı fonks. erişememizi sağlıyor
    var hucreProtocol: HucreProtocol?
    var indexPath: IndexPath?
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        hucreProtocol?.buttonaTiklandi(indexPath: indexPath!)
    }
}
