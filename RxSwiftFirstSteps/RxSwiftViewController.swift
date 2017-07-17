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
    
    @IBOutlet var unitLabel: UILabel!
    @IBOutlet var unitSlider: UISlider!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObservables()
    }
    
    func setupObservables() {
        
        let priceObservable = priceSlider.rx.value
            .asObservable()
            .share()
        
        priceObservable
            .map{ CurrencyFormatter.shared.format($0) }
            .bind(to: priceLabel.rx.text)
            .addDisposableTo(disposeBag)
        
        let unitObservable = unitSlider.rx.value
            .asObservable()
            .share()
        
        unitObservable
            .map{ Int($0) }
            .map{ "\($0) units" }
            .bind(to: unitLabel.rx.text)
            .addDisposableTo(disposeBag)
        
        
        let combinedObservable = Observable.combineLatest(priceObservable,
                                                          unitObservable) {($0,$1)}
            
        combinedObservable
            .asObservable()
            .filter { $0 > 50 && $1 > 50}
            .map{ ($0 * Float($1), $1) }
            .map{(CurrencyFormatter.shared.format($0), $1)}
            .map{ "Big Sale. \($1) units for \($0)" }
            .subscribe(onNext: { message in
                print(message)
            })
            .addDisposableTo(disposeBag)
        
    }
}
