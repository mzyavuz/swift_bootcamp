//
//  ViewController.swift
//  Odev4
//
//  Created by M.Zeynep Yavuz on 1.10.2022.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func aGitButton(_ sender: Any) {
        performSegue(withIdentifier: "aSayfasinaGit", sender: nil)
    }
    
    @IBAction func xGitButton(_ sender: Any) {
        performSegue(withIdentifier: "xSayfasinaGit", sender: nil)
    }
}

