//
//  ViewController.swift
//  DetayliTableView
//
//  Created by M.Zeynep Cakmakci on 4.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var urunlerTableView: UITableView!
    
    var urunlerListe = [Urunler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let u1 = Urunler(urunId: 1, urunAd: "Macbook Pro 14", urunResimAd: "bilgisayar", urunFiyat: 43999)
        let u2 = Urunler(urunId: 2, urunAd: "Rayban Club Master", urunResimAd: "gozluk", urunFiyat: 1600)
        let u3 = Urunler(urunId: 3, urunAd: "Sony Series", urunResimAd: "kulaklik", urunFiyat: 2199)
        let u4 = Urunler(urunId: 4, urunAd: "Gio Armani", urunResimAd: "parfum", urunFiyat: 1799)
        let u5 = Urunler(urunId: 5, urunAd: "Casio X Series", urunResimAd: "saat", urunFiyat: 3999)
        let u6 = Urunler(urunId: 6, urunAd: "Dyson V8", urunResimAd: "supurge", urunFiyat: 8799)
        let u7 = Urunler(urunId: 7, urunAd: "IPhone 13", urunResimAd: "telefon", urunFiyat: 27999)
        urunlerListe.append(u1)
        urunlerListe.append(u2)
        urunlerListe.append(u3)
        urunlerListe.append(u4)
        urunlerListe.append(u5)
        urunlerListe.append(u6)
        urunlerListe.append(u7)
        
        urunlerTableView.delegate = self
        urunlerTableView.dataSource = self
        
        urunlerTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource, HucreProtocol {
    
    // Toplam cell sayısı
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunlerListe.count
    }
    
    // Cell'lerin içinin düzeni (Cell'e erişim buradan)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let urun = urunlerListe[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "urunHucre") as! UrunTableViewCell
        
        cell.urunResimImageView.image = UIImage(named: urun.urunResimAd!)
        cell.urunAdLabel.text = urun.urunAd
        cell.urunFiyatLabel.text = "\(urun.urunFiyat!) ₺"
        
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1) // white 0 ile 1 arasında, alpha 0 görünmez 1 en görünür
        cell.hucreArkaplan.layer.cornerRadius = 10.0
        
        //
        cell.hucreProtocol = self
        cell.indexPath = indexPath // UrunTableViewCell'e bu verileri gonderiyor
        
        //Seçme stili olmadan öteki sayfaya geçiyor
        cell.selectionStyle = .none
        
        return cell
    }
    
    // Swipe action
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let urun = urunlerListe[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {
            (ca, v, b) in
            print("\(urun.urunAd!) silindi")
        }
        
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle") {
            (ca, v, b) in
            print("\(urun.urunAd!) düzenlendi")
        }
        
        return UISwipeActionsConfiguration(actions: [silAction, duzenleAction])
    }
    
    // Hangi urun tıklandı
    func buttonTiklandi(indexPath: IndexPath) {
        let urun = urunlerListe[indexPath.row]
        print("\(urun.urunAd!) sepete eklendi")
        // Tetiklemek için Cell'e gidiyoruz
    }
    
    // urun seçildiğinde detay sayfasına veri gotureleceği söyleniyor
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urun = urunlerListe[indexPath.row]
        
        performSegue(withIdentifier: "toDetay", sender: urun)
    }
    
    // götürülen verinin hangi urun olduğunu söylüyor
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let urun = sender as? Urunler {
                let gidelecekVC = segue.destination as! DetayVC
                gidelecekVC.urun = urun
            }
        }
    }
}

