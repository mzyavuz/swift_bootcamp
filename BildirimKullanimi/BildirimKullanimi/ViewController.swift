//
//  ViewController.swift
//  BildirimKullanimi
//
//  Created by M.Zeynep Cakmakci on 16.10.2022.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var izinKontrol = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge /*bildirim üzerindeki işaretler*/], completionHandler: {
            (granted/*onaylandı mı?*/, error) in
            self.izinKontrol = granted
            
            UNUserNotificationCenter.current().delegate = self
        })
        
        
        
            
        }
    
    @IBAction func buttonBildirimOlustur(_ sender: Any) {
        if izinKontrol {
            let evetAction = UNNotificationAction(identifier: "evet", title: "Evet", options: .foreground)
            let iptalAction = UNNotificationAction(identifier: "iptal", title: "İptal", options: .destructive)
            
            let kategori = UNNotificationCategory(identifier: "kategori", actions: [evetAction, iptalAction], intentIdentifiers: [])
            
            UNUserNotificationCenter.current().setNotificationCategories([kategori])
            
            let icerik = UNMutableNotificationContent()
            icerik.title = "Başlık"
            icerik.subtitle = "Alt Başlık"
            icerik.body = "Mesaj"
            icerik.badge = 1
            icerik.sound = UNNotificationSound.default
            
            icerik.categoryIdentifier = "kategori"
            
            let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 10 /*saniye*/, repeats: false /*Tekrarlama sıklığı minumun 60 sn yani 1 dk, daha sık olmuyor*/)
            
            let bildirimIstegi = UNNotificationRequest(identifier: "id", content: icerik, trigger: tetikleme)
            
            UNUserNotificationCenter.current().add(bildirimIstegi)
        }
    }
}

extension ViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge]) //Bildirim banner olarak üstten gözüküyor
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let app = UIApplication.shared
        
        if app.applicationState == .active { //Foreground
            print("Bildirim tıklandı - Foreground")
        }
        
        if app.applicationState == .inactive { //Background
            print("Bildirim tıklandı - Background")
        }
    
        app.applicationIconBadgeNumber = 0
        
        if response.actionIdentifier == "evet" {
            print("Evet seçildi")
        }
        
        if response.actionIdentifier == "iptal" {
            print("İptal seçildi")
        }
            
        //print("Bildirim tıklandı") //Bildirime tıklanınca çalışıyor
        completionHandler()
    }
}
