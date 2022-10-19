//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Yavuz on 2.10.2022.
//

import UIKit

class AnasayfaVC: UIViewController {
    // Protokol varsa yetkilendirmen gerekiyor

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var kisilerListe = [Kisiler]()
    
    var anasayfaPresenterNesnesi: ViewToPresenterAnasayfaProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self // searchBar ile protokolü bağlanıldı
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        AnasayfaRouter.createModule(ref: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.kisileriYukle()
        // Neden burada yapıyoruz?
        // Her sayfa yeni açıldığında arayüzü güncellememiz gerekiyor
        // Her gelişte yeni verileri göstermek gerekiyor (Arayüzü güncellememiz gerekiyor)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // Sayfa geçişindeki veri transferini okumak için
        if segue.identifier == "toDetay" {
            if let kisi = sender as? Kisiler {
                let gidilecekVC = segue.destination as! KisiDetayVC
                gidilecekVC.kisi = kisi
            }
        }
    }
    
    
}
extension AnasayfaVC: PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(kisilerListesi: [Kisiler]) {
        self.kisilerListe = kisilerListesi
        DispatchQueue.main.async {
            self.kisilerTableView.reloadData()
        }
    }
}

extension AnasayfaVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
}


extension AnasayfaVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListe[indexPath.row] //Sıra ile kisi listesindeki kisilere ulaşılıyor
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! TableViewHucre
        hucre.kisiBilgiLabel.text = "\(kisi.kisi_ad!) - \(kisi.kisi_tel!)"
        return hucre
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: kisi)
        print("\(kisi.kisi_ad!) seçildi")
        tableView.deselectRow(at: indexPath, animated: true) // seçim oluyor tekrar eski haline dönüyor
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil") {
            (contexualAction , view, bool) in
            let kisi = self.kisilerListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) {
                action in
                self.anasayfaPresenterNesnesi?.sil(kisi_id: Int(kisi.kisi_id!)!)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
