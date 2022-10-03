//
//  ViewController.swift
//  WidgetsKullanimi
//
//  Created by M.Zeynep Yavuz on 29.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSonuc: UILabel!
    
    @IBOutlet weak var textfieldGirdi: UITextField!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var labelSlider: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var labelStepper: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelSlider.text = String(Int(slider.value))
        labelStepper.text = String(Int(stepper.value))
        indicator.isHidden = true
    }
    
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
        let secilenIndeks = segmentedControl.selectedSegmentIndex
        let secilenKategori = segmentedControl.titleForSegment(at: secilenIndeks)
        print("En son seçim : \(secilenKategori!)")
        print("Slider Sonuç : \(slider.value)")
        print("Stepper Sonuç : \(stepper.value)")
    }
    
    @IBAction func segmentedDegisim(_ sender: UISegmentedControl) {
        let secilenIndeks = sender.selectedSegmentIndex
        let secilenKategori = sender.titleForSegment(at: secilenIndeks)
        print("Seçim : \(secilenKategori!)")
    }
    
    @IBAction func sliderDegisim(_ sender: UISlider) {
        labelSlider.text = String(Int(sender.value))
        
    }
    
    
    @IBAction func stepperDegisim(_ sender: UIStepper) {
        labelStepper.text = String(Int(sender.value))
    }
    
    
    @IBAction func buttonBasla(_ sender: Any) {
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    @IBAction func buttonDur(_ sender: Any) {
        indicator.isHidden = true
        indicator.stopAnimating()
    }
}

