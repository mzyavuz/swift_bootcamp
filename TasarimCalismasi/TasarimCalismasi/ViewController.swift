//
//  ViewController.swift
//  TasarimCalismasi
//
//  Created by M.Zeynep Yavuz on 27.09.2022.
//

import UIKit
// left: leading = start
// right = trailing = end

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Pizza"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "anaRenk") // Arkaplan Rengi
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "yaziRenk1")!, .font: UIFont(name: "Pacifico-Regular", size: 22)!] // Yazi Rengi ve Fontu
        navigationController?.navigationBar.barStyle = .black // Üstteki ikonların ve saatin rengini beyaz yapıyor
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }


}

