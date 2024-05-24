//
//  DetaySayfa.swift
//  UrunlerApp
//
//  Created by Furkan on 24.05.2024.
//

import UIKit

class DetaySayfa: UIViewController {

    @IBOutlet weak var iamgeViewUrun: UIImageView!
    @IBOutlet weak var labelUrunFiyat: UILabel!
    
    var urun:Urunler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let u = urun{
            self.navigationItem.title = u.ad
            iamgeViewUrun.image = UIImage(named: u.resim!)
            labelUrunFiyat.text = "\(u.fiyat!) ₺"
        }
    }
    

    @IBAction func buttonSepeteEkle(_ sender: Any) {
        if let u = urun{
            print("Detay Sayfa: \(u.ad!) sepete eklendi")
        }
    }
    

}
