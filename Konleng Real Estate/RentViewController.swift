//
//  SellViewController.swift
//  Konleng Real Estate
//
//  Created by MacBooK  on 2/1/18.
//  Copyright © 2018 Vicheanak. All rights reserved.
//

import Foundation
import XLPagerTabStrip

class RentViewController: UIViewController, IndicatorInfoProvider {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Rent")
    }
    
    
}

