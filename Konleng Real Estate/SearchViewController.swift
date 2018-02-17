//
//  SearchViewController.swift
//  Konleng Real Estate
//
//  Created by MacBooK  on 2/1/18.
//  Copyright © 2018 Vicheanak. All rights reserved.
//

import UIKit
import Foundation
import XLPagerTabStrip

class SearchViewController: ButtonBarPagerTabStripViewController {

    let blueInstagramColor = UIColor(red: 37/255.0, green: 111/255.0, blue: 206/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = blueInstagramColor
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .black
            newCell?.label.textColor = self?.blueInstagramColor
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
//        let mapViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mapViewStoryBoard")
//        let listViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "listStoryBoard")
//        return [mapViewController, listViewController]
        let mapChildViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mapStoryBoard")
        let listChildViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "listStoryBoard")
        return [mapChildViewController, listChildViewController]
    }



}
