//
//  listChildViewController.swift
//  Konleng Real Estate
//
//  Created by MacBooK  on 2/3/18.
//  Copyright © 2018 Vicheanak. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ListChildViewController: UIViewController, IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "List")
    }
    

}
