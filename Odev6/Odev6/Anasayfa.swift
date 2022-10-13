//
//  ViewController.swift
//  Odev6
//
//  Created by M.Zeynep Cakmakci on 7.10.2022.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var kategorilerCollectionView: UICollectionView!
    
    @IBOutlet weak var kampanyalarCollectionView: UICollectionView!
    
    @IBOutlet weak var sizinIcinLabel: UILabel!
    
    @IBOutlet weak var sizinIcinCollectionView: UICollectionView!
    
    var kategorilerListe = ["Çok Al Az Öde", "Kampanyalar", "Öne Çıkanlar", "Çok Al Az Öde", "Çok Satanlar", "Günün Yıldızı"]
    
    var kampanyalarListe = [Kampanya]()
    
    var sizinIcinUrunListe = ["https://cdn05.e-bebek.com/mnresize/1200/1200/media/p/bebek-temizleme-pamugu-15x60-adet_8680075432924_01.jpg","https://cdn05.e-bebek.com/mnresize/1200/1200/media/p/islak-havlu-zeytinyagi-ve-pamuk-90li_8681212063520_01.jpg","https://cdn05.e-bebek.com/mnresize/1200/1200/media/p/zeytinyagli-islak-mendil-24x90-ad_8682241203550_01.jpg",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        kategorilerCollectionView.delegate = self
        kategorilerCollectionView.dataSource = self
        
        kampanyalarCollectionView.delegate = self
        kampanyalarCollectionView.dataSource = self
        
        sizinIcinCollectionView.delegate = self
        sizinIcinCollectionView.dataSource = self
        
        let kmpny1 = Kampanya(kampanyaAd: "Seçili Prima Bebek Bezlerinde Net %15 İndirim!", kampanyaResimUrl: "https://cdn05.e-bebek.com/media/c/pp-banner-prima-m.jpg")
        let kmpny2 = Kampanya(kampanyaAd: "Tüm Oyuncaklarda 2.Ürüne Net %50 İndirim!", kampanyaResimUrl: "https://cdn05.e-bebek.com/media/c/pp-banner3-m.jpg")
        let kmpny3 = Kampanya(kampanyaAd: "baby me 15x60 Bebek Temizleme Pamuğunda Net %15 İndirim!", kampanyaResimUrl: "https://cdn05.e-bebek.com/media/c/pp-banner8-m.jpg")
        
        kampanyalarListe.append(kmpny1)
        kampanyalarListe.append(kmpny2)
        kampanyalarListe.append(kmpny3)
        
        searchBar.layer.cornerRadius = 10
        
        
        sizinIcinLabel.textColor = UIColor.darkGray
        
        let katLayout = UICollectionViewFlowLayout()
        katLayout.itemSize = CGSizeMake(140, 40)
        katLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        katLayout.minimumLineSpacing = 10
        kategorilerCollectionView.collectionViewLayout = katLayout
        
        let kampLayout = UICollectionViewFlowLayout()
        kampLayout.itemSize = CGSizeMake(370, 300)
        kampLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        kampLayout.minimumLineSpacing = 20
        kampLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        kampanyalarCollectionView.collectionViewLayout = kampLayout
        
        let sizLayout = UICollectionViewFlowLayout()
        sizLayout.itemSize = CGSizeMake(180, 300)
        sizLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        sizLayout.minimumLineSpacing = 10
        sizinIcinCollectionView.collectionViewLayout = sizLayout
        
        self.tabBarController?.tabBar.layer.borderWidth = 0.5
        self.tabBarController?.tabBar.layer.borderColor = UIColor.gray.cgColor
    }


}

extension Anasayfa: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Ara: \(searchText)")
    }
}

extension Anasayfa: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.kategorilerCollectionView {
            return kategorilerListe.count
        } else if collectionView == self.kampanyalarCollectionView {
            return kampanyalarListe.count
        } else {
            return sizinIcinUrunListe.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == kategorilerCollectionView {
            let kategori = kategorilerListe[indexPath.row]
            let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "kategorilerHucre", for: indexPath) as! KategorilerCollectionViewCell
            
            hucre.kategorilerLabel.text = kategori
                if indexPath.row == 0 {
                    hucre.kategorilerLabel.textColor = UIColor.orange
                    hucre.backgroundColor = UIColor(named: "kampanyaText")
                    hucre.layer.cornerRadius = 20
                    
                }
           
            return hucre
        } else if collectionView == self.kampanyalarCollectionView {
            let kampanya = kampanyalarListe[indexPath.row]
            let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "kampanyalarHucre", for: indexPath) as! KampanyalarCollectionViewHucre
            
            hucre.kampanyaLabel.text = kampanya.kampanyaAd!
            hucre.kampanyaLabel.numberOfLines = 2
            hucre.kampanyaLabel.lineBreakMode = .byWordWrapping
            hucre.kampanyaLabel.textColor = UIColor.lightGray
            hucre.kampanyaLabel.textAlignment = NSTextAlignment.left
            hucre.kampanyaLabel.preferredMaxLayoutWidth = 300
            
            
            let url = URL(string: kampanya.kampanyaResimUrl!)
            let data = try? Data(contentsOf: url!)

            if let imageData = data {
                let image = UIImage(data: imageData, scale: 3.1)
                
                hucre.kampanyaImageView.image = image
            }
            hucre.layer.borderColor = UIColor.lightGray.cgColor
            hucre.layer.borderWidth = 0.3
            hucre.layer.cornerRadius = 15
            
            hucre.contentView.layer.cornerRadius = 15.0
            hucre.contentView.layer.borderWidth = 1.0
            hucre.contentView.layer.borderColor = UIColor.clear.cgColor
            hucre.contentView.layer.masksToBounds = true

            hucre.layer.backgroundColor = UIColor.white.cgColor
            hucre.layer.shadowColor = UIColor.lightGray.cgColor
            hucre.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            hucre.layer.shadowRadius = 2.0
            hucre.layer.shadowOpacity = 1.0
            hucre.layer.masksToBounds = false
            hucre.layer.shadowPath = UIBezierPath(roundedRect:hucre.bounds, cornerRadius:hucre.contentView.layer.cornerRadius).cgPath
            
            
            return hucre
        } else {
            let sizinUrun = sizinIcinUrunListe[indexPath.row]
            let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "sizinIcinHucre", for: indexPath) as! SizinIcinCollectionViewCell
            
            let url = URL(string: sizinUrun)
            let data = try? Data(contentsOf: url!)
            
            if let imageData = data {
                let image = UIImage(data: imageData, scale: 5)
                
                hucre.sizinImage.image = image
            }
            hucre.layer.borderColor = UIColor.lightGray.cgColor
            hucre.layer.borderWidth = 0.3
            hucre.layer.cornerRadius = 15
            
            hucre.favImage.layer.shadowColor = UIColor.lightGray.cgColor
            hucre.favImage.layer.shadowOffset = CGSize(width: 0, height: 2.0)
            hucre.favImage.layer.shadowRadius = 2.0
            hucre.favImage.layer.shadowOpacity = 1.0
            
            return hucre
        }
    }
    
}
