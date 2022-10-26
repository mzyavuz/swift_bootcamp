//
//  SiparisDuzenleme.swift
//  Yemek_Siparis_Uygulamasi
//
//  Created by M.Zeynep Cakmakci on 24.10.2022.
//

import Foundation

class SiparisDuzenleme {
    
    func gelenSiparisDuzenleme(gelenYemekListe: [Yemek]) -> [Yemek] {
        var duzenlenmisListe = [Yemek]()
        duzenlenmisListe.append(gelenYemekListe[0])
        for i in 1...gelenYemekListe.count {
            var yemekVarMi = false
            var j = 0
            while j < duzenlenmisListe.count+1 {
                if (gelenYemekListe[i].yemek_adi == duzenlenmisListe[j].yemek_adi) {
                  yemekVarMi = true
                  duzenlenmisListe[j].yemek_siparis_adet =
                      String(Int(duzenlenmisListe[j].yemek_siparis_adet!)! +
                          Int(gelenYemekListe[i].yemek_siparis_adet!)!)
                    
                }
                if !yemekVarMi {
                    duzenlenmisListe.append(gelenYemekListe[i])
                    j+=1
                }
          }
        }
        return duzenlenmisListe
    }
    
    
}
