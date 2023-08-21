//
//  ViewController.swift
//  Currency Converter
//
//  Created by midDeveloper on 3.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Sayfa yüklendikten sonraki ekstra ayarlamaları burada yapın.
    }


    @IBAction func getRatesClicked(_ sender: Any) {
        
        viewModel.getData { currency in
            DispatchQueue.main.async {
                let c = currency.rates
                
                if let usd = c["USD"],
                   let cad = c["CAD"],
                   let jpy = c["JPY"],
                   let gbp = c["GBP"],
                   let tl = c["TRY"],
                   let chf = c["CHF"] {
                    if let cadlabeltext = self.cadLabel.text,let usdlabeltext = self.usdLabel.text,let jpylabeltext = self.jpyLabel.text,let gbpLabeltext = self.gbpLabel.text,let trylabeltext = self.tryLabel.text,let chflabeltext = self.chfLabel.text {
                        // Burada cinsinden işlemleri gerçekleştirin.
                        self.cadLabel.text = "\(cadlabeltext)  \(cad)"
                        self.usdLabel.text = "\(usdlabeltext)  \(usd)"
                        self.jpyLabel.text = "\(jpylabeltext)  \(jpy)"
                        self.gbpLabel.text = "\(gbpLabeltext)  \(gbp)"
                        self.tryLabel.text = "\(trylabeltext)  \(tl)"
                        self.chfLabel.text = "\(chflabeltext)  \(chf)"
                    }
                 
                    
                    
                }
            }
        }
    }
    
}

