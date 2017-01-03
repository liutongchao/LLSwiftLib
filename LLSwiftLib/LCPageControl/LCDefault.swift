//
//  LCDefault.swift
//  LCPageControlDemo
//
//  Created by 刘通超 on 2016/12/30.
//  Copyright © 2016年 北京京师乐学教育科技有限公司. All rights reserved.
//

import UIKit

class LCDefault: UIView {
    
    let contentView = UIView()
    var index = Int()
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
        contentView.frame = CGRect.init(x: 0, y: 0, width: 10, height: 10)
        contentView.backgroundColor = UIColor.white
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 5
        contentView.center = CGPoint.init(x: width/2, y: height/2)
        
        addSubview(contentView)
    }
    
    func changeStatus(status:PageStatus = .Normal) {
        switch status {
        case .Normal:
            contentView.width = 10
            contentView.center = CGPoint.init(x: width/2, y: height/2)
        case .Select:
            contentView.width = 20
            contentView.center = CGPoint.init(x: width/2, y: height/2)
        }
    }
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
