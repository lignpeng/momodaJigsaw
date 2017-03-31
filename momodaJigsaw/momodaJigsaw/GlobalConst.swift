//
//  GlobalConst.swift
//  momodaJigsaw
//
//  Created by lignpeng on 17/3/30.
//  Copyright © 2017年 lignpeng. All rights reserved.
//
/*
 全局常量
 
 */

import UIKit

//*********** frame *************

let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width

func x(object:UIView) -> CGFloat {
    return object.frame.origin.x
}

func y(object:UIView) -> CGFloat {
    return object.frame.origin.y
}

func width(object:UIView) -> CGFloat {
    return object.frame.size.width
}

func height(object:UIView) -> CGFloat {
    return object.frame.size.height
}

func center(object:UIView) -> CGPoint {
    return object.center
}

//************ 扩展 *************
//给UIColor添加扩展
extension UIColor {
    /// 用十六进制颜色创建UIColor
    /// - Parameter hexColor: 十六进制颜色 (0F0F0F)
    convenience init(hexColor: String) {
        // 存储转换后的数值
        var red:UInt32 = 0, green:UInt32 = 0, blue:UInt32 = 0
        // 分别转换进行转换
        Scanner(string: hexColor[0..<2]).scanHexInt32(&red)
        Scanner(string: hexColor[2..<4]).scanHexInt32(&green)
        Scanner(string: hexColor[4..<6]).scanHexInt32(&blue)
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
    }
}
//String的扩展
extension String {
    /// String使用下标截取字符串
    /// 例: "示例字符串"[0..<2] 结果是 "示例"
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            return self[startIndex..<endIndex]
        }
    }
}
//*************************










