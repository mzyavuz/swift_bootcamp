//
//  ViewController.swift
//  KullaniciEtkilesimi
//
//  Created by M.Zeynep Yavuz on 2.10.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func buttonAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert) // Alert ile action sheet : style farkı
        
        self.present(alertController, animated: true)
        // Kapanması için buton lazım
        // Boşluklara tıklayınca kapanması için de ekstra kod gerekiyor
        
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel) {
            action/*UIAlertAction'ı temsil ediyor*/ in print("İptal seçildi")
        }
        alertController.addAction(iptalAction)
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive) {
            action/*UIAlertAction'ı temsil ediyor*/ in print("Tamam seçildi")
        }
        alertController.addAction(tamamAction)
    }
    
    @IBAction func buttonActionSheet(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .actionSheet) // Alert ile action sheet : style farkı
        
        self.present(alertController, animated: true)
        
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel) {
            action/*UIAlertAction'ı temsil ediyor*/ in print("İptal seçildi")
        }
        alertController.addAction(iptalAction)
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive) {
            action/*UIAlertAction'ı temsil ediyor*/ in print("Tamam seçildi")
        }
        alertController.addAction(tamamAction)
    }
    
    @IBAction func buttonOzelAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert) // Alert ile action sheet : style farkı
        
        alertController.addTextField { tf/*TextFieldi temsil ediyor*/ in tf.placeholder = "Veri giriniz"
            tf.keyboardType = .numberPad
            tf.isSecureTextEntry = true
        }
        
        let kaydetAction = UIAlertAction(title: "Kaydet", style: .destructive) {
            action/*UIAlertAction'ı temsil ediyor*/ in
            let textField = alertController.textFields![0] as UITextField//İlk yapıyı getiriyor
            if let alinanVeri = textField.text {
                print("Veri \(alinanVeri)")
            }
            
            print("Kaydet seçildi")
            
        }
        alertController.addAction(kaydetAction)
        
        self.present(alertController, animated: true)
    }
}

