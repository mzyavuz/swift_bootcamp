//
//  SepetVC.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 22.10.2022.
//

import UIKit

class SepetVC: UIViewController {

    @IBOutlet weak var sepetKullaniciLabel: UILabel!
    @IBOutlet weak var sepetTableView: UITableView!
    @IBOutlet weak var sepetUcretLabel: UILabel!
    @IBOutlet weak var sepetBosaltButton: UIButton!
    @IBOutlet weak var siparisVerButton: UIButton!
    
    var sepettekiYemekListe = [Yemek]()
    var sepetUcret = 0
    
    var kullanici_adi = "Melike"
        
    var sepetPresenterNesnesi: ViewToPresenterSepetProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sepetTableView.delegate = self
        sepetTableView.dataSource = self

        SepetRouter.createModule(ref: self)
        
        sepetKullaniciLabel.text = "\(kullanici_adi)'ının Sepeti"
        
        SepetRouter.createModule(ref: self)
        
        sepetTableView.rowHeight = 100.0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.sepetPresenterNesnesi?.sepettekiYemekleriYukle(kullanici_adi: self.kullanici_adi)
        }
      
    }
    
    @IBAction func sepetBosaltButtonaBasildi(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Sepeti Boşalt", message: "Tüm Sepeti Boşaltmak İstediğinizden Emin Misiniz?", preferredStyle: .alert)
             
         self.present(alertController, animated: true)
         
         let iptalAction = UIAlertAction(title: "Hayır", style: .cancel) { action in
             
         }
         alertController.addAction(iptalAction)
         
         let tamamAction = UIAlertAction(title: "Evet", style: .destructive) { action in
             for i in self.sepettekiYemekListe {
                 self.sepetPresenterNesnesi?.yemekSil(sepet_yemek_id: i.sepet_yemek_id!, kullanici_adi: self.kullanici_adi)
                 self.viewaToplamUcretiGonder(sepet_ucret: self.sepetUcret)
             }
             
         }
         alertController.addAction(tamamAction)
        
      
    }
    
    @IBAction func siparisVerButtonaBasildi(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Siparişinizi Onaylıyor Musunuz?", message: "", preferredStyle: .actionSheet)
        
         self.present(alertController, animated: true)
         
         let iptalAction = UIAlertAction(title: "Hayır", style: .cancel) {
             action in 
         }
         alertController.addAction(iptalAction)
         
         let tamamAction = UIAlertAction(title: "Evet", style: .destructive) {
             action in for i in self.sepettekiYemekListe {
                 self.sepetPresenterNesnesi?.yemekSil(sepet_yemek_id: i.sepet_yemek_id!, kullanici_adi: self.kullanici_adi)
                 self.viewaToplamUcretiGonder(sepet_ucret: self.sepetUcret)
             }
         }
         alertController.addAction(tamamAction)
    }
    
}

extension SepetVC: PresenterToViewSepetProtocol {
    
    func vieweVeriGonder(sepetYemekListe: [Yemek]) {
        self.sepettekiYemekListe = sepetYemekListe
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
            if sepetYemekListe.count != 0 {
                self.sepetBosaltButton.isHidden = false
            } else {
                self.sepetBosaltButton.isHidden = true
                self.siparisVerButton.isEnabled = false
            }
        }
    }
    
    func viewaToplamUcretiGonder(sepet_ucret: Int) {
        DispatchQueue.main.async {
            self.sepetUcretLabel.text = String(sepet_ucret) + " ₺"
        }
    }
}

extension SepetVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepettekiYemekListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = sepettekiYemekListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "sepetCell") as! SepetTableViewCell
        
        ResimFunction().resimYukle(yemek: yemek, imageView: hucre.sepetYemekResim)
        hucre.sepetYemekAdLabel.text = yemek.yemek_adi!
        hucre.sepetSiparisAdetLabel.text = yemek.yemek_siparis_adet!
        hucre.sepetUcretLabel.text = String(yemek.toplam_ucret ?? 0) + " ₺"
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {
            (contexualAction , view, bool) in
            let yemek = self.sepettekiYemekListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yemek.yemek_adi!) sepetten çıkarılsın mı?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                self.sepetPresenterNesnesi?.yemekSil(sepet_yemek_id: yemek.sepet_yemek_id!, kullanici_adi: self.kullanici_adi)
                self.viewaToplamUcretiGonder(sepet_ucret: self.sepetUcret)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
