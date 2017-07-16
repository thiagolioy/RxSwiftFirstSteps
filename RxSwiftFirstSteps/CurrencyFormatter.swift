//
//  CurrencyFormatter.swift
//  RxSwiftFirstSteps
//
//  Created by Thiago Lioy on 16/07/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

import Foundation

class CurrencyFormatter {
    static let shared = CurrencyFormatter()
    private let formatter: NumberFormatter
    private init() {
        formatter = NumberFormatter()
        formatter.numberStyle = .currency
    }
    
    func format(_ number: Float) -> String {
        let num = NSNumber(value: number)
        return formatter.string(from: num)!
    }
}
