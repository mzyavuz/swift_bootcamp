//
//  ViewController.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 22.10.2022.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var yemekCollectionView: UICollectionView!
    
    var kullanici_adi: String?
    var yemekListe = [Yemek]()
    
    var anasayfaPresenterNesnesi: ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        yemekCollectionView.delegate = self
        yemekCollectionView.dataSource = self
        
        AnasayfaRouter.createModule(ref: self)
        
        let tasarim = UICollectionViewFlowLayout()
                
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10 // dikey min. boşluk
        tasarim.minimumLineSpacing = 10 // yatay min. boşluk
        
        let ekranGenisligi = UIScreen.main.bounds.width
        let hucreGenisligi = (ekranGenisligi - 30) / 2
        
        tasarim.itemSize = CGSize(width: hucreGenisligi, height: hucreGenisligi*1.2) // yüksekliği hucregenisligine oranlayıp yaz
        
        yemekCollectionView.collectionViewLayout = tasarim
        
        anasayfaPresenterNesnesi?.yemekleriYukle()
    }

}

extension Anasayfa: PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemekListe: [Yemek]) {
        self.yemekListe = yemekListe
        DispatchQueue.main.async {
            self.yemekCollectionView.reloadData()
        }
    }
}

extension Anasayfa: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            anasayfaPresenterNesnesi?.yemekleriYukle()
        } else {
            anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
        }
    }
}

extension Anasayfa: UICollectionViewDelegate, UICollectionViewDataSource, HucreProtocol {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return yemekListe.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let yemek = yemekListe[indexPath.row]
                
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yemekCell", for: indexPath) as! YemekCollectionViewHucre
        
        
        cell.yemekAdLabel.text = yemek.yemek_adi!
        cell.yemekFiyatLabel.text = "\(yemek.yemek_fiyat!) ₺"
                
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
                
        cell.hucreProtocol = self // viewControllerda cell'i işaret eder
        cell.indexPath = indexPath
        
        ResimFunction().resimYukle(yemek: yemek, imageView: cell.yemekResim)
            
        return cell
    }
    
    func buttonaTiklandi(indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yemek = yemekListe[indexPath.row]
        yemek.kullanici_adi = kullanici_adi
        performSegue(withIdentifier: "yemekToDetay", sender: yemek)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "yemekToDetay"
        {
            if let yemek = sender as? Yemek {
                let gidilecekVC = segue.destination as! YemekDetayVC
                gidilecekVC.yemek = yemek
            }
        }
    }
}


