//
//  UploadViewController.swift
//  Konleng Real Estate
//
//  Created by MacBooK  on 2/2/18.
//  Copyright © 2018 Vicheanak. All rights reserved.
//

import UIKit
import Eureka
import MapKit
import CoreLocation
import TLPhotoPicker
import Photos
import ViewRow
import SwiftChart
import Material
import Motion
import RSSelectionMenu
import SnapKit

class UploadViewController: UIViewController, TLPhotosPickerViewControllerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate{
    
  
    @IBOutlet weak var uploadBtn: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    let simpleDataArray = ["Sachin", "Rahul", "Saurav", "Virat", "Suresh", "Ravindra", "Chris", "Steve", "Anil"]
    var simpleSelectedArray = [String]()
    
    var firstRowSelected = true
    var purposeView = UIView()
    
    let dataArray = ["Sachin Tendulkar", "Rahul Dravid", "Saurav Ganguli", "Virat Kohli", "Suresh Raina", "Ravindra Jadeja", "Chris Gyle", "Steve Smith", "Anil Kumble"]
    var selectedDataArray = [String]()
    
    var customDataArray = [Person]()
    var customselectedDataArray = [Person]()
    
    @IBAction func pushBtn(_ sender: Any) {
        presentWithMultiSelectionAndSearch()
    }
    
    var myArray = ["Purpose"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let tableView = UITableView(frame: self.view.bounds, style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        self.view.addSubview(purposeView)
        
        purposeView.snp.makeConstraints {make in
            make.top.equalTo(uploadBtn.snp.bottom).offset(20)
            make.left.equalTo(self.view).offset(10)
            make.right.equalTo(self.view).offset(-10)
            make.height.equalTo(50)
        }
        
        purposeView.addSubview(tableView)
        
        
        
        
        customDataArray.append(Person(id: 1, firstName: "Sachin", lastName: "Tendulkar"))
        customDataArray.append(Person(id: 2, firstName: "Rahul", lastName: "Dravid"))
        customDataArray.append(Person(id: 3, firstName: "Virat", lastName: "Kohli"))
        customDataArray.append(Person(id: 4, firstName: "Suresh", lastName: "Raina"))
        customDataArray.append(Person(id: 5, firstName: "Chris", lastName: "Gyle"))
        customDataArray.append(Person(id: 6, firstName: "Ravindra", lastName: "Jadeja"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FormTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "formIdentifier")
        cell.nameLabel.text = "Hello"
//        cell.nameLabel.addTarget(self, action: #selector(pressedBrowser(sender: )), for: UIControlEvents.touchUpInside)

        return cell
        
    }
    func pressedBrowser(sender: UIButton) {
        print("pressedBrowser")
    }

    
    func showAsPush() {
        
        // Show menu with datasource array - Default SelectionType = Single
        // Here you'll get cell configuration where you can set any text based on condition
        // Cell configuration following parameters.
        // 1. UITableViewCell   2. Object of type T   3. IndexPath
        
        let selectionMenu =  RSSelectionMenu(dataSource: simpleDataArray) { (cell, object, indexPath) in
            cell.textLabel?.text = object
            
            // Change tint color (if needed)
            cell.tintColor = .orange
//            print("selected")
        }
        
        // set navigation title
        selectionMenu.setNavigationBar(title: "Select Player")
        
        // set default selected items when menu present on screen.
        // Here you'll get onDidSelectRow
        
        selectionMenu.setSelectedItems(items: simpleSelectedArray) { (text, isSelected, selectedItems) in
            
            // update your existing array with updated selected items, so when menu presents second time updated items will be default selected.
            self.simpleSelectedArray = selectedItems
            
            print(selectedItems)
        }
        
        // show as PresentationStyle = Push
        selectionMenu.show(style: .Push, from: self)
    }
    
    func presentModallyWithRightDetail() {
        
        // Show menu with datasource array - SelectionType = Single & CellType = RightDetail
        
        let selectionMenu =  RSSelectionMenu(selectionType: .Single, dataSource: dataArray, cellType: .RightDetail) { (cell, object, indexPath) in
            
            // here you can set any text from object
            // let's set firstname in title and lastname as right detail
            
            let firstName = object.components(separatedBy: " ").first
            let lastName = object.components(separatedBy: " ").last
            
            cell.textLabel?.text = firstName
            cell.detailTextLabel?.text = lastName
        }
        
        selectionMenu.setSelectedItems(items: selectedDataArray) { (text, selected, selectedItems) in
            self.selectedDataArray = selectedItems
        }
        
        // To show first row as Empty, when dropdown as no value selected by default
        // Here you'll get Text and isSelected when user selects first row
        
        selectionMenu.addFirstRowAs(rowType: .Empty, showSelected: self.firstRowSelected) { (text, isSelected) in
            self.firstRowSelected = isSelected
        }
        
        // show as default
        selectionMenu.show(from: self)
    }
    
    func showAsFormSheetWithSearch() {
        
        // Show menu with datasource array - PresentationStyle = Formsheet & SearchBar
        
        let selectionMenu = RSSelectionMenu(dataSource: dataArray) { (cell, object, indexPath) in
            cell.textLabel?.text = object
        }
        
        // show selected items
        selectionMenu.setSelectedItems(items: selectedDataArray) { (text, selected, selectedItems) in
            self.selectedDataArray = selectedItems
        }
        
        // show searchbar with placeholder text and barTintColor
        // Here you'll get search text - when user types in seachbar
        
        selectionMenu.showSearchBar(withPlaceHolder: "Search Player", tintColor: UIColor.white.withAlphaComponent(0.3)) { (searchText) -> ([String]) in
            
            // return filtered array based on any condition
            // here let's return array where firstname starts with specified search text
            
            return self.dataArray.filter({ $0.lowercased().hasPrefix(searchText.lowercased()) })
        }
        
        // show as formsheet
        selectionMenu.show(style: .Formsheet, from: self)
    }
    
    func showAsPopover(_ sender: UIView) {
        
        // Show as Popover with datasource
        
        let selectionMenu = RSSelectionMenu(dataSource: simpleDataArray) { (cell, object, indexPath) in
            cell.textLabel?.text = object
        }
        
        selectionMenu.setSelectedItems(items: simpleSelectedArray) { (text, isSelected, selectedItems) in
            
            // update your existing array with updated selected items, so when menu presents second time updated items will be default selected.
            self.simpleSelectedArray = selectedItems
        }
        
        // show as popover
        // Here specify popover sourceView and size of popover
        // specifying nil will present with default size
        
        selectionMenu.show(style: .Popover(sourceView: sender, size: nil), from: self)
    }
    
    func presentWithMultiSelectionAndSearch() {
        
        // Show menu with datasource array - SelectionType = Multiple, CellType = SubTitle & SearchBar
        
        let selectionMenu =  RSSelectionMenu(selectionType: .Multiple, dataSource: dataArray, cellType: .SubTitle) { (cell, object, indexPath) in
            
            // set firstname in title and lastname as subTitle
            
            let firstName = object.components(separatedBy: " ").first
            let lastName = object.components(separatedBy: " ").last
            
            cell.textLabel?.text = firstName
            cell.detailTextLabel?.text = lastName
        }
        
        selectionMenu.setSelectedItems(items: selectedDataArray) { (text, selected, selectedItems) in
            self.selectedDataArray = selectedItems
            print(selectedItems)
        }
        
        // To show first row as All, when dropdown as All selected by default
        // Here you'll get Text and isSelected when user selects first row
        
        selectionMenu.addFirstRowAs(rowType: .All, showSelected: self.firstRowSelected) { (text, isSelected) in
            self.firstRowSelected = isSelected
        }
        
        // show searchbar
        // Here you'll get search text - when user types in seachbar
        selectionMenu.showSearchBar { (searchtext) -> ([String]) in
            return self.dataArray.filter({ $0.lowercased().hasPrefix(searchtext.lowercased()) })
        }
        
        // set navigationbar theme
        selectionMenu.setNavigationBar(title: "Select Player", attributes: nil, barTintColor: UIColor.orange.withAlphaComponent(0.5))
        
        // right barbutton title
        selectionMenu.rightBarButtonTitle = "Submit"
        
        // show as default
        selectionMenu.show(from: self)
    }
    
    
    
//    var imageArray = [UIImage]()
//    var imageArray = [UIImage(named: "blank_camera"),UIImage(named: "blank_add"),UIImage(named: "blank_add"),UIImage(named: "blank_add"),UIImage(named: "blank_add"),UIImage(named: "blank_add")]
    
    var imageArray: [UIImage] = []
    var maxSelectedAssets = 5
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
    
        cell.imgImage.image = imageArray[indexPath.row]
        
        cell.deleteButton?.layer.setValue(indexPath.row, forKey: "index")
        cell.deleteButton?.addTarget(self, action: #selector(deleteImage), for: UIControlEvents.touchUpInside)
      
        
        return cell
    }
    
    
    @IBAction func uploadButton(_ sender: Any) {
        uploadImage()
    }
    
    @objc func uploadImage(){
        let viewController = TLPhotosPickerViewController()
        viewController.delegate = self
        viewController.didExceedMaximumNumberOfSelection = { [weak self] (picker) in
            self?.showExceededMaximumAlert(vc: picker)
        }
        var configure = TLPhotosPickerConfigure()
        
        configure.allowedVideo = false
        configure.allowedVideoRecording = false
        configure.maxSelectedAssets = maxSelectedAssets
        viewController.configure = configure
        
        //configure.nibSet = (nibName: "CustomCell_Instagram", bundle: Bundle.main) // If you want use your custom cell..
        self.present(viewController, animated: true, completion: nil)
    }
    
    @objc func deleteImage(sender:UIButton!) {
        
        let i : Int = (sender.layer.value(forKey: "index")) as! Int
        self.imageArray.remove(at: i)
        self.maxSelectedAssets += 1

        self.collectionView.reloadData()
    }
    
    var selectedAssets = [TLPHAsset]()
    
    @objc func multipleSelectorDone(_ item:UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    let initialHeight = Float(200.0)
    
    
    
    func dismissPhotoPicker(withTLPHAssets: [TLPHAsset]) {
        self.selectedAssets = withTLPHAssets
        getAllSelectedImages()

    }
    
    func getAsyncCopyTemporaryFile() {
        if let asset = self.selectedAssets.first {
            asset.tempCopyMediaFile(progressBlock: { (progress) in
                print(progress)
            }, completionBlock: { (url, mimeType) in
                print(mimeType)
            })
        }
    }
    
    func getAllSelectedImages(){
        for selectedImage in self.selectedAssets{
            let asset = selectedImage
            self.maxSelectedAssets -= 1
            self.imageArray.append(asset.fullResolutionImage!)
        }
        self.collectionView.reloadData()
    }
    
    
    
    
    func photoPickerDidCancel() {
        // cancel
    }
    
    func dismissComplete() {
        // picker dismiss completion
    }
    
    func didExceedMaximumNumberOfSelection(picker: TLPhotosPickerViewController) {
        self.showExceededMaximumAlert(vc: picker)
    }
    
    func handleNoCameraPermissions(picker: TLPhotosPickerViewController) {
        let alert = UIAlertController(title: "", message: "No camera permissions granted", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showExceededMaximumAlert(vc: UIViewController) {
        let alert = UIAlertController(title: "", message: "Exceed Maximum Number Of Selection", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
        
}
