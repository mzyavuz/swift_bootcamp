//
//  SayfaX.swift
//  Odev4
//
//  Created by M.Zeynep Yavuz on 1.10.2022.
//

import UIKit

class SayfaX: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Sayfa X"
        sayfaXLabel.textColor = UIColor.systemMint

    }
    
    @IBOutlet weak var sayfaXLabel: UILabel!
    
    
    @IBAction func ySayfaGit(_ sender: Any) {
    }
}
