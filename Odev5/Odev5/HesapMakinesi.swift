//
//  ViewController.swift
//  Odev5
//
//  Created by M.Zeynep Cakmakci on 3.10.2022.
//

import UIKit

class HesapMakinesi: UIViewController {

    @IBOutlet weak var sonucLabel: UILabel!
    
    @IBOutlet weak var button9: Sayilar!
    
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
    
    var sonuc: Int?
    var ilkSayi: Int?
    var ikinciSayi: Int?
    var ilkSayiMi: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //sonucLabel
        sonucLabel.layer.borderWidth = 1.0
        sonucLabel.layer.borderColor = UIColor.systemMint.cgColor
        sonucLabel.layer.cornerRadius = 10.0
        sonucLabel.layer.masksToBounds = true
        
        ilkSayiMi = true
    
        
        //Number Buttons' color
        
        
        
    }
    
    
    @IBAction func clicked9(_ sender: Any) {
        self.button9.degisken = 9
        
        sonuc = self.button9.topla(ilkSayiMi: ilkSayiMi!, ilkSayi: ilkSayi)
        sonucLabel.text = String(sonuc!)
        
        if ilkSayiMi == false {
            ikinciSayi = degis
        }
        
    }
    
    

}



