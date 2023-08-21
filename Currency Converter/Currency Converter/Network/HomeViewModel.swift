//
//  HomeViewModel.swift
//  Currency Converter
//
//  Created by midDeveloper on 18.08.2023.
//

import Foundation
import UIKit
class HomeViewModel {
    
    
    func getData(completion: @escaping ((CurrencyData) -> Void)){
        // 1.
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=8024d78916d1c66060ec2e1844587210")
        let session = URLSession.shared
        
        // Closure
        let task = session.dataTask(with: url!) { ( data, response, error) in
            
            if error == nil{
                // 2.
                if data != nil{
                    do {
                        if let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String: Any] {
                           
                                 //   print(jsonResponse)
                            if let success = jsonResponse["success"] as? Bool {
                                if let rates = jsonResponse["rates"] as? [String : Double]{
                                    if let base = jsonResponse["base"] as? String {
                                        var currency = CurrencyData(success: success, base: base, rates: rates )
                                        completion(currency)
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
