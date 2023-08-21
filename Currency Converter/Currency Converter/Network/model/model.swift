//
//  model.swift
//  Currency Converter
//
//  Created by midDeveloper on 18.08.2023.
//

import Foundation

struct CurrencyData {
    let success: Bool
    let base: String
    let rates: [String: Double]
}

