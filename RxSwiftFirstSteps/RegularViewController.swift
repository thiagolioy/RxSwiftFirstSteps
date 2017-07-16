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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPriceEvent()
    }
    
    func setupPriceEvent() {
        priceSlider.addTarget(self, action: #selector(priceSliderChanged), for: .valueChanged)
    }
    
    @objc
    func priceSliderChanged(_ sender: UISlider) {
        let formattedPrice = CurrencyFormatter.shared.format(sender.value)
        priceLabel.text = formattedPrice
    }
    
}
