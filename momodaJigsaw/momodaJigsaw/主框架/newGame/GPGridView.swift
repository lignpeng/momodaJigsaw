//
//  GPGridView.swift
//  momodaJigsaw
//
//  Created by lignpeng on 17/4/1.
//  Copyright © 2017年 lignpeng. All rights reserved.
//

import UIKit

class GPGridView: UIView {
    //行：row，column：列
    var gridData:(row:Int,column:Int,frame:CGRect) = (0,0,CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //设置背景色为透明，否则是黑色背景
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawGrid(gridData: self.gridData)
    }
    
    func updateGridView(gridData:(row:Int,column:Int,frame:CGRect)) {
        self.gridData = gridData
        self.setNeedsDisplay(frame)
    }
    func drawGrid(gridData:(row:Int,column:Int,frame:CGRect)) {
        //绘制外框
        guard let context = UIGraphicsGetCurrentContext() else {
            NSLog("获取绘图上下文")
            return
        }
        let margin:CGFloat = 1
        var frame = self.bounds.insetBy(dx: 2, dy: 2)
//        frame.origin.x -= margin
//        frame.origin.y -= margin
//        frame.size.width += margin * 2
//        frame.size.height += margin * 2
        
        let path = CGMutablePath()
        path.addRect(frame)
        context.addPath(path)
        context.setStrokeColor(UIColor.init(hexColor: "33ff33").cgColor)
        context.drawPath(using: .stroke)
        if (gridData.row == 0 && gridData.column == 0) {
            return
        }
        
    }
    
}
