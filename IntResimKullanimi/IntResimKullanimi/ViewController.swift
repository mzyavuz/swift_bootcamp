//
//  ViewController.swift
//  IntResimKullanimi
//
//  Created by M.Zeynep Cakmakci on 13.10.2022.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var ivResim: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resimGosterKingFisher(resimAdi: "ayran.png")

    }

    @IBAction func buttonResim1(_ sender: Any) {
        resimGosterKingFisher(resimAdi: "kofte.png")
    }
    
    
    @IBAction func buttonResim2(_ sender: Any) {
        resimGosterKingFisher(resimAdi: "pizza.png")
    }
    
    func resimGosterURLSession(resimAdi: String) {
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)") {
            DispatchQueue.global().async {
                
                if let data = try? Data(contentsOf: url) {
                    
                    DispatchQueue.main.async {
                        self.ivResim.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    func resimGosterKingFisher(resimAdi: String) {
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)") {
            DispatchQueue.main.async {
                self.ivResim.kf.setImage(with: url) //kingfisher nesnesi
            }
        }
    }
}

