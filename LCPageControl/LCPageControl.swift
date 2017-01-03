//
//  LCPageControl.swift
//  LCPageControlDemo
//
//  Created by 刘通超 on 2016/12/30.
//  Copyright © 2016年 北京京师乐学教育科技有限公司. All rights reserved.
//

import UIKit

class LCPageControl: UIView {
    
    let stack = UIView()
    
    var currIndex = 0
    
    var pageStyle = PageStyle.Default
    
    
    var itemCount = 5
    var itemWidth = 25
    var itemSpace = 5
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(stack)
        configView()
    }
    
    init(frame: CGRect, style:PageStyle) {
        super.init(frame: frame)
        self.pageStyle = style
        self.addSubview(stack)
        configView()
    }
    
    init(frame: CGRect, style:PageStyle,itemCount:Int,itemWidth:Int,itemSpace:Int) {
        super.init(frame: frame)
        self.itemCount = itemCount
        self.itemWidth = itemWidth
        self.itemSpace = itemSpace
        self.pageStyle = style
        self.addSubview(stack)
        configView()
    }
    
    func configView() {
        stack.height = height
        for index in 0 ..< itemCount {
            let x = (itemWidth+itemSpace)*index
            let y = (stack.height - CGFloat(itemWidth))/2
            let temp = createItemView(frame: CGRect.init(x: x, y: Int(y), width: itemWidth, height: itemWidth), style: pageStyle, index: index)
            
            stack.addSubview(temp)
        }
        
        stack.width = CGFloat((itemWidth+itemSpace)*itemCount - itemSpace)
        stack.center = CGPoint.init(x: width/2, y: height/2)
    }
    
    func createItemView(frame: CGRect, style:PageStyle, index:Int) -> UIView {
        switch style {
        case .CircleNumber:
            let temp = LCCircleNumber.init(frame: frame)
            temp.backgroundColor = UIColor.clear
            temp.index = index
            temp.tag = index
            if index == 0 {
                temp.status = .Select
            }
            
            return temp
        default:
            let temp = LCDefault.init(frame: frame)
            temp.backgroundColor = UIColor.clear
            temp.index = index
            temp.tag = index
            if index == 0 {
                temp.status = .Select
            }
            return temp
        }
    }
    
    func setCurrIndex(index:Int) {
        guard index < itemCount else {
            return
        }
        guard index >= 0 else {
            return
        }

        currIndex = index
        switch pageStyle {
        case .CircleNumber:
            UIView.animate(withDuration: 0.5) {
                for item in self.stack.subviews {
                    let temp = item as! LCCircleNumber
                    temp.status = (temp.tag == index) ? .Select :.Normal
                }
            }
            
        default:
            UIView.animate(withDuration: 0.5) {
                for item in self.stack.subviews {
                    let temp = item as! LCDefault
                    temp.status = (temp.tag == index) ? .Select :.Normal
                }
            }
        }
    }
    
    func setItemCount(count:Int) {
        itemCount = count
    }

}

extension UIView{
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }

}
