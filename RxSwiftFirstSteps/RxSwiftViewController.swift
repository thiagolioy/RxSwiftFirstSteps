//
//  RxSwiftViewController.swift
//  RxSwiftFirstSteps
//
//  Created by Thiago Lioy on 16/07/17.
//  Copyright © 2017 Thiago Lioy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxSwiftViewController: UIViewController {
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var priceSlider: UISlider!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPriceObservable()
    }
    
    func setupPriceObservable() {
        priceSlider.rx.value
            .asObservable()
            .map{ CurrencyFormatter.shared.format($0) }
            .bind(to: priceLabel.rx.text)
            .addDisposableTo(disposeBag)
    }
}
