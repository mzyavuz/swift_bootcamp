//
//  ViewController.swift
//  Odev5
//
//  Created by M.Zeynep Cakmakci on 3.10.2022.
//

import UIKit

class HesapMakinesi: UIViewController {

    @IBOutlet weak var sonucLabel: UILabel!
    
    @IBOutlet weak var button9: UIButton!
    
    @IBOutlet weak var button8: UIButton!
    
    @IBOutlet weak var button7: UIButton!
    
    @IBOutlet weak var button6: UIButton!
    
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button0: UIButton!
    
    @IBOutlet weak var buttonEqual: UIButton!
    
    @IBOutlet weak var buttonAdd: UIButton!
    
    @IBOutlet weak var buttonClear: UIButton!
    
    var islem = Sayilar()
    var sonuc: Int?
    var toplanacakSayi: Int?
    var sayiVarMi: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //sonucLabel
        sonucLabel.layer.borderWidth = 1.0
        sonucLabel.layer.borderColor = UIColor.systemMint.cgColor
        sonucLabel.layer.cornerRadius = 10.0
        sonucLabel.layer.masksToBounds = true
        
        sayiVarMi = false
    
        
        //Number Buttons' color
        //button0.backgroundColor = UIColor(named: "IntButtonColor")
        //button0.tintColor = UIColor(named: "IntButtonColor")
        
        
    }
    
    
    @IBAction func clicked9(_ sender: Any) {
        islem.degisken = 9
        
        sayiButtonunaTiklandi()
        
    }
    
    @IBAction func clicked8(_ sender: Any) {
        islem.degisken = 8
        
        sayiButtonunaTiklandi()
    }
    
    @IBAction func clicked7(_ sender: Any) {
        islem.degisken = 7
        
        sayiButtonunaTiklandi()
    }
    
    @IBAction func clicked6(_ sender: Any) {
        islem.degisken = 6
        
        sayiButtonunaTiklandi()
    }
    
    @IBAction func clicked5(_ sender: Any) {
        islem.degisken = 5
        
        sayiButtonunaTiklandi()
    }
    
    @IBAction func clicked4(_ sender: Any) {
        islem.degisken = 4
        
        sayiButtonunaTiklandi()
    }
    
    @IBAction func clicked3(_ sender: Any) {
        islem.degisken = 3
        
        sayiButtonunaTiklandi()
    }
    
    @IBAction func clicked2(_ sender: Any) {
        islem.degisken = 2
        
        sayiButtonunaTiklandi()
    }
    
    @IBAction func clicked1(_ sender: Any) {
        islem.degisken = 1
        
        sayiButtonunaTiklandi()
    }
    
    @IBAction func clicked0(_ sender: Any) {
        islem.degisken = 0
        
        sayiButtonunaTiklandi()
    }
    
    @IBAction func clickedAdd(_ sender: Any) {
        toplanacakSayi = sonuc
        sonuc = nil
        sayiVarMi = false
        sonucLabel.text = "+"
        
    }
    
    
    @IBAction func clickedEqualTo(_ sender: Any) {
        if sayiVarMi == true && toplanacakSayi != nil {
            sonuc = toplanacakSayi!.topla(sayi: sonuc!)
        } else if toplanacakSayi != nil {
            sonuc = toplanacakSayi
        } else if sayiVarMi == true {
            sonuc = sonuc!
        } else {
            sonuc = 0
        }
        sonucLabel.text = String(sonuc!)
        sayiVarMi = false
        toplanacakSayi = nil
        
        
    }
    
    @IBAction func clickedClearAll(_ sender: Any) {
        sayiVarMi = false
        toplanacakSayi = 0
        sonuc = 0
        sonucLabel.text = String(sonuc!)
    
    
    }
    
    func sayiButtonunaTiklandi() {
        if sayiVarMi == true {
            sonuc = islem.sayiVarIslem(ilkSayi: sonuc!)
        } else {
            sonuc = islem.sayiYokIslem()
            sayiVarMi = !sayiVarMi!
        }
        sonucLabel.text = String(sonuc!)
    }
}



