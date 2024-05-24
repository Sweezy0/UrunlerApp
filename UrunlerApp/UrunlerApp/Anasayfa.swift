//
//  ViewController.swift
//  UrunlerApp
//
//  Created by Furkan on 24.05.2024.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var urunlerTableView: UITableView!
    var urunlerListesi = [Urunler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urunlerTableView.delegate = self
        urunlerTableView.dataSource = self
        
        let urun1 = Urunler(id: 1, ad: "Macbook Pro 14", resim: "bilgisayar", fiyat: 43000)
        let urun2 = Urunler(id: 2, ad: "Rayban Club Master", resim: "gozluk", fiyat: 2500)
        let urun3 = Urunler(id: 3, ad: "Sony ZX Series", resim: "kulaklik", fiyat: 40000)
        let urun4 = Urunler(id: 4, ad: "Gio Armani", resim: "parfum", fiyat: 2000)
        let urun5 = Urunler(id: 5, ad: "Casio X Series", resim: "saat", fiyat: 8000)
        let urun6 = Urunler(id: 6, ad: "Dyson V8", resim: "supurge", fiyat: 18000)
        let urun7 = Urunler(id: 7, ad: "IPhone 13", resim: "telefon", fiyat: 32000)
        
        urunlerListesi.append(urun1)
        urunlerListesi.append(urun2)
        urunlerListesi.append(urun3)
        urunlerListesi.append(urun4)
        urunlerListesi.append(urun5)
        urunlerListesi.append(urun6)
        urunlerListesi.append(urun7)
        
        urunlerTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        
    }
}

extension Anasayfa: UITableViewDelegate, UITableViewDataSource, HucreProtocol{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunlerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let urun = urunlerListesi[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! UrunlerHucre // Hücre sınıfına erişmek
        hucre.imageViewUrun.image = UIImage(named: urun.resim!)
        hucre.labelUrunAd.text = urun.ad
        hucre.labelUrunFiyat.text = "\(urun.fiyat!) ₺"
        
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.hucreArkaPlan.layer.cornerRadius = 10.0
        
        hucre.hucreProtocol = self
        hucre.indexPath = indexPath
        
        return hucre
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? { //Kaydırma işlemi
        let urun = urunlerListesi[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ UIContextualAction, view, Bool in
            print("\(urun.ad!) silindi ")
        }
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle"){ UIContextualAction, view, Bool in
            print("\(urun.ad!) düzenlendi")
        }
        return UISwipeActionsConfiguration(actions: [silAction, duzenleAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //Seçilen satır
        let urun = urunlerListesi[indexPath.row]
        print("\(urun.ad!) seçildi ")
        performSegue(withIdentifier: "toDetay", sender: urun)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {//hangi sayfaya ve nereye veri göndereceğimizi seçmek
        if segue.identifier == "toDetay"{
            if let urun = sender as? Urunler{
                let gidilcekVC = segue.destination as! DetaySayfa
                gidilcekVC.urun = urun
            }
        }
    }
    
    func sepeteEkleTiklandi(indexPath: IndexPath) {
        let urun = urunlerListesi[indexPath.row]
        print("\(urun.ad!) sepete eklendi!")
    }
}

