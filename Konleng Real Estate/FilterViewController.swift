//
//  FilterViewController.swift
//  Konleng Real Estate
//
//  Created by MacBooK  on 2/10/18.
//  Copyright © 2018 Vicheanak. All rights reserved.
//

import UIKit
import Eureka

class FilterViewController: FormViewController {

    @IBAction func closeBtn(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form +++ Section()
        
        <<< SegmentedRow<String>() {
            $0.options = ["Any", "Buy", "Rent"]
            $0.value = $0.options?.first
        }
            
        +++ Section("Location")
        <<< ActionSheetRow<String>() {
            $0.title = "Province"
            $0.selectorTitle = "Pick a number"
            $0.options = ["All", "One","Two","Three"]
            $0.value = "All"
           
            }.onChange{ row in
                let districtRow: ActionSheetRow<String> = self.form.rowBy(tag: "districtRow")!
                districtRow.options = ["All"]
                districtRow.value = "All"
                districtRow.updateCell()
        }
        
        <<< ActionSheetRow<String>("districtRow") {
            $0.title = "District"
            $0.selectorTitle = "Select District"
            $0.options = ["All"]
            $0.value = "All"
            }.onChange{ row in
                let communeRow: ActionSheetRow<String> = self.form.rowBy(tag: "communeRow")!
                
                communeRow.options = ["All"]
                communeRow.value = "All"
                communeRow.updateCell()
        }
        
        <<< ActionSheetRow<String>("communeRow") {
            $0.title = "Commune"
            $0.selectorTitle = "Select Commune"
            $0.options = ["All"]
            $0.value = "All"
        }
    
        +++ Section("Property Type")
        <<< MultipleSelectorRow<String>() {
            $0.title = "MultipleSelectorRow"
            $0.options = ["All", "Apartment", "House"]
            $0.value = ["all", "apartment", "house"]
        }
        
     
            
        +++ Section("Price Range - USD")
        <<< IntRow() {
            $0.title = "Price Min"
        }
        <<< IntRow() {
            $0.title = "Price Max"
        }
            
        +++ Section("Bedrooms")
        <<< SegmentedRow<String>() {
            $0.options = ["Any", "1+", "2+", "3+", "4+", "5+"]
            $0.value = $0.options?.first
       
        }
        +++ Section("Bedrooms")
        <<< SegmentedRow<String>() {
            $0.options = ["Any", "1+", "2+", "3+", "4+", "5+"]
            $0.value = $0.options?.first
        }
        
        +++ Section()
        <<< TextRow(){ row in
            row.title = "Keywords"
            row.placeholder = "eg. Pool"
        }
            
        +++ Section()
        <<< ButtonRow() {
            $0.title = "Search"
            
        }
        .onCellSelection {  cell, row in
            
        }
    }
}
