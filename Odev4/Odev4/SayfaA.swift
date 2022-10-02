//
//  SayfaA.swift
//  Odev4
//
//  Created by M.Zeynep Yavuz on 1.10.2022.
//

import UIKit

class SayfaA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Sayfa A"
        
        
    }
    
    @IBAction func bGitButton(_ sender: Any) {
        performSegue(withIdentifier: "bSayfasinaGit", sender: nil)
        
    }
    
}
