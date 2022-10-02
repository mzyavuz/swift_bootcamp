//
//  SayfaY.swift
//  Odev4
//
//  Created by M.Zeynep Yavuz on 1.10.2022.
//

import UIKit

class SayfaY: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Sayfa Y"
        sayfaYLabel.textColor = UIColor.systemMint
        
        if let rootVC = navigationController?.viewControllers.first {
            navigationController?.viewControllers = [rootVC,self]
        }
    }
    
    @IBOutlet weak var sayfaYLabel: UILabel!
    
    
    @IBAction func anasayfaDonButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
