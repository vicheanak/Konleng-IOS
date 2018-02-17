//
//  SavedViewController.swift
//  Konleng Real Estate
//
//  Created by MacBooK  on 2/11/18.
//  Copyright © 2018 Vicheanak. All rights reserved.
//

import UIKit
import SnapKit


class SavedViewController: UIViewController {
    
    lazy var topBox = UIView()
    lazy var bottomBox = UIView()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        topBox.backgroundColor = UIColor.black
        bottomBox.backgroundColor = UIColor.blue
        
        self.view.addSubview(topBox)
        self.view.addSubview(bottomBox)
        
        topBox.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view).offset(100)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
        bottomBox.snp.makeConstraints{ (make) in
            make.top.equalTo(topBox.snp.bottom).offset(10)
            make.centerX.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        
    }


}
