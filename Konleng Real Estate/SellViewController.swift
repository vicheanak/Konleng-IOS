//
//  SellViewController.swift
//  Konleng Real Estate
//
//  Created by MacBooK  on 2/1/18.
//  Copyright © 2018 Vicheanak. All rights reserved.
//
//
//  UploadViewController.swift
//  Konleng Real Estate
//
//  Created by MacBooK  on 2/2/18.
//  Copyright © 2018 Vicheanak. All rights reserved.
//

import UIKit

import Foundation
import XLPagerTabStrip


class SellViewController: UIViewController, IndicatorInfoProvider {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Sell")
    }
    
   
}


