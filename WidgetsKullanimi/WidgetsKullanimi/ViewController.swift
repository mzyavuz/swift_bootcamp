//
//  ViewController.swift
//  WidgetsKullanimi
//
//  Created by M.Zeynep Yavuz on 29.09.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var labelSonuc: UILabel!
    
    @IBOutlet weak var textfieldGirdi: UITextField!
    
    @IBAction func buttonYap(_ sender: Any) {
        if let alinanVeri = textfieldGirdi.text {
            labelSonuc.text = alinanVeri
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func buttonResim1(_ sender: Any) {
        imageView.image = UIImage(named: "mutlu")
        
    }
    @IBAction func buttonResim2(_ sender: Any) {
        imageView.image = UIImage(named: "uzgun")
    }
    
    @IBOutlet weak var mSwitch: UISwitch!
    
    
    @IBAction func switchKontrol(_ sender: UISwitch) {
        if sender.isOn {
            print("Switch : ON")
        } else {
            print("Switch : OFF")
        }
    }
    
    @IBAction func buttonGoster(_ sender: Any) {
        print("Switch en son durum \(mSwitch.isOn)")
    }
    
}

