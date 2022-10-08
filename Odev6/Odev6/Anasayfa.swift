//
//  ViewController.swift
//  Odev6
//
//  Created by M.Zeynep Cakmakci on 7.10.2022.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var kategorilerTableView: UITableView!
    
    @IBOutlet weak var kampanyalarCollectionView: UICollectionView!
    
    var kategorilerListe = ["Perşembeden Pazara", "Kampanyalar", "Öne Çıkanlar", "Çok Al Az Öde", "Çok Satanlar", "Günün Yıldızı"]
    
    var kampanyalarListe = [Kampanya]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        kategorilerTableView.delegate = self
        kategorilerTableView.dataSource = self
        
        kampanyalarCollectionView.delegate = self
        kampanyalarCollectionView.dataSource = self
        
        let kmpny1 = Kampanya(kampanyaAd: "Seçili Prima Bebek Bezlerinde Net %15 İndirim!", kampanyaResimUrl: "https://cdn05.e-bebek.com/media/c/pp-banner-prima-m.jpg")
        let kmpny2 = Kampanya(kampanyaAd: "Tüm Oyuncaklarda 2.Ürüne Net %50 İndirim!", kampanyaResimUrl: "https://cdn05.e-bebek.com/media/c/pp-banner3-m.jpg")
        let kmpny3 = Kampanya(kampanyaAd: "baby me 15x60 Bebek Temizleme Pamuğunda Net %15 İndirim!", kampanyaResimUrl: "https://cdn05.e-bebek.com/media/c/pp-banner8-m.jpg")
        
        kampanyalarListe.append(kmpny1)
        kampanyalarListe.append(kmpny2)
        kampanyalarListe.append(kmpny3)
    }


}

extension Anasayfa: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Ara: \(searchText)")
    }
}

extension Anasayfa: UITableViewDelegate, UITableViewDataSource {
    // İlk olarak kaç tane veri göstereceğim
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kategorilerListe.count
    }
    
    //Hücreleri sırasıyla veri aktarıp, hangisini seçtiğimizi bilmek için (cellForRowAt: O satırı temsil edecek hücre)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kategori = kategorilerListe[indexPath.row] //ilgili kategorinin ismi (hucreye yansıtalacak isim)
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kategorilerHucre") as! KategorilerTableViewHucre //hucrem
        
        // Labela değeri atadık
        hucre.kategorilerLabel.text = kategori
        
        return hucre
    }
    
}

extension Anasayfa: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kampanyalarListe.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let kampanya = kampanyalarListe[indexPath.row]
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "kampanyalarHucre", for: indexPath) as! KampanyalarCollectionViewHucre
        
        hucre.kampanyaLabel.text = kampanya.kampanyaAd!
        hucre.layer.borderColor = UIColor.lightGray.cgColor
        hucre.layer.borderWidth = 0.3
        
        return hucre
    }
}
