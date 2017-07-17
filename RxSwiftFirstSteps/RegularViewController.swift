//
//  RegularViewController.swift
//  RxSwiftFirstSteps
//
//  Created by Thiago Lioy on 16/07/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

import UIKit

class RegularViewController: UIViewController {
    
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var priceSlider: UISlider!
    
    @IBOutlet var unitLabel: UILabel!
    @IBOutlet var unitSlider: UISlider!
    
    var lastPrice: Float = 0
    var lastUnit: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEvents()
    }
    
    func setupEvents() {
        priceSlider.addTarget(self, action: #selector(priceSliderChanged), for: .valueChanged)
        
        unitSlider.addTarget(self, action: #selector(unitSliderChanged), for: .valueChanged)
    }
    
    @objc
    func priceSliderChanged(_ sender: UISlider) {
        let formattedPrice = CurrencyFormatter.shared.format(sender.value)
        priceLabel.text = formattedPrice
        lastPrice = sender.value
        notifyIfBigSell()
    }
    
    @objc
    func unitSliderChanged(_ sender: UISlider) {
        unitLabel.text = "\(Int(sender.value)) units"
        lastUnit = sender.value
        notifyIfBigSell()
    }
    
    func notifyIfBigSell() {
        if lastPrice > 50 && lastUnit > 50 {
            let result = lastPrice * lastUnit
            let formattedResult = CurrencyFormatter.shared.format(result)
            
            print("Big Sell! \(lastUnit) units for \(formattedResult)")
        }
    }
    
}
