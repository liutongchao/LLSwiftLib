//
//  LCCircleNumber.swift
//  LCPageControlDemo
//
//  Created by 刘通超 on 2017/1/3.
//  Copyright © 2017年 北京京师乐学教育科技有限公司. All rights reserved.
//

import UIKit

class LCCircleNumber: UIView {

    let contentView = UIView()
    let contentLab = UILabel()
    var index:Int{
        get{
            return self.tag
        }
        
        set{
            
            contentLab.text = "\(newValue+1)"
        }
    }
    
    var status: PageStatus{
        get{
            return .Normal
        }
        set{
            changeStatus(status: newValue)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configView()
    }
    
    func configView() {
        contentView.frame = CGRect.init(x: 0, y: 0, width: width, height: height)
        contentView.backgroundColor = UIColor.white
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = width/2
        
        addSubview(contentView)
        
        contentLab.frame = contentView.frame
        contentLab.backgroundColor = UIColor.clear
        contentLab.text = "\(index+1)"
        contentLab.textColor = UIColor.darkGray
        contentLab.textAlignment = .center
        contentLab.font = UIFont.systemFont(ofSize: 15)
        
        contentView.addSubview(contentLab)
        
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 1.5
        contentView.layer.borderColor = UIColor.white.cgColor
        
    }
    
    func changeStatus(status:PageStatus = .Normal) {
        switch status {
        case .Normal:
            contentView.backgroundColor = UIColor.white
            contentLab.textColor = .darkGray
        case .Select:
            contentView.backgroundColor = UIColor.init(red: 0.169, green: 0.525, blue: 0.922, alpha: 1.00)
            contentLab.textColor = .white
        }
    }
    
    


}
