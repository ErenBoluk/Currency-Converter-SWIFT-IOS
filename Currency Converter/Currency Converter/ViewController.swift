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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRatesClicked(_ sender: Any) {
        print("Click Rates Button")
        // 1) Request & Session
        // 2) Response & Data
        // 3) Parsing & JSON Serialization
        
        // 1.
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=8024d78916d1c66060ec2e1844587210")
        let session = URLSession.shared
        
        // Closure
        let task = session.dataTask(with: url!) { ( data, response, error) in
            
            if error != nil{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil )
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                
            }else{
                
                // 2.
                if data != nil{
                    do {
                        if let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any] {
                            if let success = jsonResponse["success"] as? Bool {
                                if success {
                                    print(jsonResponse)
                                    
                                    if let rates = jsonResponse["rates"] as? [String: Any] {
                                        if let cadRate = rates["CAD"], let chfRate = rates["CHF"], let gbpRate = rates["GBP"], let jpyRate = rates["JPY"], let usdRate = rates["USD"], let tryRate = rates["TRY"] {
                                            DispatchQueue.main.async {
                                                self.cadLabel.text = "\(self.cadLabel.text!) \(cadRate)"
                                                self.chfLabel.text = "\(self.chfLabel.text!) \(chfRate)"
                                                self.gbpLabel.text = "\(self.gbpLabel.text!) \(gbpRate)"
                                                self.jpyLabel.text = "\(self.jpyLabel.text!) \(jpyRate)"
                                                self.usdLabel.text = "\(self.usdLabel.text!) \(usdRate)"
                                                self.tryLabel.text = "\(self.tryLabel.text!) \(tryRate)"
                                            }
                                        }
                                    }
                                } else {
                                    DispatchQueue.main.async {
                                        let alert = UIAlertController(title: "Api Error", message: "Api bağlantısında bir sorun oluştu", preferredStyle: .alert)
                                        let btn = UIAlertAction(title: "Tamam :<", style: .destructive)
                                        alert.addAction(btn)
                                        
                                        self.present(alert, animated: true)
                                    }
                                }
                            }
                        }
                    } catch {
                        print("JSON serialization error: \(error)")
                    }

                }
            }
            }
            task.resume()
            
                
            
        
    }
    
}

