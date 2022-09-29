//
//  ViewController.swift
//  CalismaYapisi
//
//  Created by Kasım on 27.09.2022.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var labelAnasayfa: UILabel!
    
    var sayac = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sayfa yüklendiğinde bir kere çalışır, bir daha çalışmaz
        print("viewDidLoad çalıştı")
        labelAnasayfa.text = String(sayac)
    }
    
    @IBAction func buttonTikla(_ sender: Any) {
        sayac += 1
        labelAnasayfa.text = String(sayac)
    }
    
    override func viewWillAppear(_ animated: Bool) { //viewDidAppear ile çok yakın, benzer zamanlı
        print("viewWillAppear çalıştı")
        // Sayfa her görüntülendiğinde çalışır, sayfaya geri dönüldüğünde çalışır
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
        // Sayfa her kapatıldığında çalışır
    }
    
    @IBAction func buttonBasla(_ sender: Any) {
        let kisi = Kisiler(ad: "Ahmet", yas: 23, boy: 1.78, bekar: true)
        performSegue(withIdentifier: "oyunEkraninaGecis", sender: kisi /*mesaj*/)
        // Göndermek istediğimiz bilgi sendera yazılıyor
        // Merhaba aşağıdaki sender a gönderiliyor
        // Aşağıdaki sender herhangi bir nesne olabilir ama bu yapıyı ben Any türünde alacağım
        // Merhabayı önce any e sonra anyden merhaba döndürmemiz gerekiyor
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare metodu çalıştı")
        
        if segue.identifier == "oyunEkraninaGecis" {
            print("oyunEkraninaGecis Çalıştı")
            
            if let veri = sender as? Kisiler {
                //print("Veri : \(veri)")
                
                let gidilecekVC = segue.destination as! OyunEkrani
                gidilecekVC.kisi = veri
            }
        }
    }
    @IBAction func buttonEkle(_ sender: Any) {
        print("Ekle Çalıştı")
    }
    @IBAction func buttonYap(_ sender: Any) {
        print("Yap çalıştı")
    }
}

