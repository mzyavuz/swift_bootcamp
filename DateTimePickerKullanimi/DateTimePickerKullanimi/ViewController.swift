//
//  ViewController.swift
//  DateTimePickerKullanimi
//
//  Created by M.Zeynep Yavuz on 2.10.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tfTarih: UITextField!
    @IBOutlet weak var tfSaat: UITextField!
    
    var datePicker: UIDatePicker?
    var timePicker: UIDatePicker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        tfTarih.inputView = datePicker
    
        timePicker = UIDatePicker() //Nesneleştirdik
        timePicker?.datePickerMode = .time // MOdunu belirledik
        tfSaat.inputView = timePicker // inputa datepickeri atadık ama henüz değer dönmüyor
        
        if #available(iOS 13.4, */*Yıldız all anlamına gelir, 13.4 ve sonrası*/) {
            datePicker?.preferredDatePickerStyle = .wheels
            timePicker?.preferredDatePickerStyle = .wheels
        }
        
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(dokunmaAlgilamaMetod))
        view.addGestureRecognizer(dokunmaAlgilama)
        datePicker?.addTarget(self, action: #selector(tarihGoster(uiDatePicker: )), for: .valueChanged)
        timePicker?.addTarget(self, action: #selector(saatGoster(uiDatePicker: )), for: .valueChanged)
    }

    @objc func dokunmaAlgilamaMetod() { // objc olmazsa yapı çalışmaz
        print("Ekrana dokunuldu")
        view.endEditing(true)
    }
    
    @objc func tarihGoster(uiDatePicker: UIDatePicker) {
        let format = DateFormatter()
        format.dateFormat = "MMM d, yyyy" // Tarihin gözükecek olan formatı
        let alinanTarih = format.string(from: uiDatePicker.date)
        tfTarih.text = alinanTarih
    }
    
    @objc func saatGoster(uiDatePicker: UIDatePicker) {
        let format = DateFormatter()
        format.dateFormat = "hh:mm" // Tarihin gözükecek olan formatı
        let alinanSaat = format.string(from: uiDatePicker.date)
        tfSaat.text = alinanSaat
    }

}

