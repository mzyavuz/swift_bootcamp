//
//  ViewController.swift
//  TabBarControllerKullanimi
//
//  Created by M.Zeynep Yavuz on 29.09.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tabItems = tabBarController?.tabBar.items {
            let anasayfaItem = tabItems[0]
            let ayarlarItem = tabItems[1]
            
            anasayfaItem.badgeValue = "1"
            ayarlarItem.badgeValue = "Yeni"
        }
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.systemIndigo
        
        renkDegistir(itemAppearance: appearance.stackedLayoutAppearance)
        renkDegistir(itemAppearance: appearance.inlineLayoutAppearance)
        renkDegistir(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
        // Bir çok ekranda aynı görüntüyü ve davranışları sağlamak için
        // Böylece tüm ekranları destekliyoruz
    }
    
    func renkDegistir(itemAppearance: UITabBarItemAppearance /*TabBar üzerindeki itemlara erişip onların renklerini değiştirmek için */ ) {
        
        // Seçili Durum
        itemAppearance.selected.iconColor = UIColor.systemOrange
        itemAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor.systemOrange
        ] // Attributes ile bir sürü özellik eklenebiliyor
        itemAppearance.selected.badgeBackgroundColor = UIColor.systemMint
        
        
        // Seçili Olmayan Durum
        itemAppearance.normal.iconColor = UIColor.white
        itemAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]// Attributes ile bir sürü özellik eklenebiliyor
        itemAppearance.normal.badgeBackgroundColor = UIColor.lightGray
    }


}

