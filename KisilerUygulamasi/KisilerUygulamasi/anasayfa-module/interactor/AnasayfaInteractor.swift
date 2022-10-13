//
//  AnasayfaInteractor.swift
//  KisilerUygulamasi
//
//  Created by M.Zeynep Cakmakci on 9.10.2022.
//

import Foundation

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    
    let db: FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        
        db = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func tumKisilerAl() {
        var liste = [Kisiler]()
        
        db?.open()
        
        do {
            let r = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            
            while r.next() {
                let kisi = Kisiler(kisi_id: Int(r.string(forColumn: "kisi_id"))!,
                                   kisi_ad: r.string(forColumn: "kisi_ad")!,
                                   kisi_tel: r.string(forColumn: "kisi_tel")!
                )
                liste.append(kisi)
            }
            anasayfaPresenter?.presenteraVeriGonder(kisilerListesi: liste)
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func kisiAra(aramaKelimesi: String) {
        print("Kisi Ara: \(aramaKelimesi)")
    }
    
    func kisiSil(kisi_id: Int) {
        print("Kisi Sil: \(kisi_id)")
    }
}
