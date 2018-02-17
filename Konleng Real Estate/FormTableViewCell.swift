//
//  FormTableViewCell.swift
//  Konleng Real Estate
//
//  Created by MacBooK  on 2/16/18.
//  Copyright © 2018 Vicheanak. All rights reserved.
//

import UIKit
import SnapKit

class FormTableViewCell: UITableViewCell {

    var myLabel1: UILabel!
    var myLabel2: UILabel!
    var myButton1 : UIButton!
    var myButton2 : UIButton!
    var nameLabel : UILabel!
    var valueLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.textColor = UIColor.black
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(10)
        }

        valueLabel = UILabel()
        valueLabel.textColor = UIColor.black
        contentView.addSubview(valueLabel)
        valueLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-10)
        }

//        let gap : CGFloat = 10
//        let labelHeight: CGFloat = 30
//        let labelWidth: CGFloat = 150
//        let lineGap : CGFloat = 5
//        let label2Y : CGFloat = gap + labelHeight + lineGap
//        let imageSize : CGFloat = 30
//
//        myLabel1 = UILabel()
//        myLabel1.frame = CGRect(x: gap, y: gap, width: labelWidth, height: labelHeight)
//        myLabel1.textColor = UIColor.black
//        contentView.addSubview(myLabel1)
//
//        myLabel2 = UILabel()
//        myLabel2.frame = CGRect(x: gap, y: label2Y, width: labelWidth, height: labelHeight)
//        myLabel2.textColor = UIColor.black
//        contentView.addSubview(myLabel2)
//
//        myButton1 = UIButton()
//        myButton1.frame = CGRect(x: bounds.width-imageSize - gap, y: gap, width: imageSize, height: imageSize)
//        myButton1.setImage(UIImage(named: "browser.png"), for: UIControlState.normal)
//        contentView.addSubview(myButton1)
//
//        myButton2 = UIButton()
//        myButton2.frame = CGRect(x: bounds.width-imageSize - gap, y: label2Y, width: imageSize, height: imageSize)
//        myButton2.setImage(UIImage(named: "telephone.png"), for: UIControlState.normal)
//        contentView.addSubview(myButton2)
        
    }
    
    
    
    //    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
