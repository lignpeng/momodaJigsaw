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
        let pFrame = self.bounds.insetBy(dx: 2, dy: 2)
//        frame.origin.x -= margin
//        frame.origin.y -= margin
//        frame.size.width += margin * 2
//        frame.size.height += margin * 2
        
        let path = CGMutablePath()
        path.addRect(pFrame)
        var lines:[(startPoint:CGPoint,endPoint:CGPoint)] = []
        //行
        if gridData.row >= 1 {
            let rowHeight = height(frame:frame)/CGFloat(gridData.row)
            for i in 0 ..< (gridData.row - 1){
                let startPoint = CGPoint(x:0,y:rowHeight * CGFloat(i + 1))
                let endPoint = CGPoint(x:width(frame: frame),y:rowHeight * (CGFloat)(i + 1))
                lines.append((startPoint: startPoint, endPoint: endPoint))
            }
        }
        //列
        if gridData.column >= 1 {
            let columnWidth = width(frame:frame)/CGFloat(gridData.column)
            for i in 0 ..< (gridData.column - 1) {
                let startPoint = CGPoint(x:columnWidth * CGFloat(i + 1),y:0)
                let endPoint = CGPoint(x:columnWidth * CGFloat(i + 1),y:height(frame: frame))
                lines.append((startPoint: startPoint, endPoint: endPoint))
            }
        }
        for line in lines {
            path.move(to: line.startPoint)
            path.addLine(to: line.endPoint)
        }
        context.addPath(path)
        context.setStrokeColor(UIColor.init(hexColor: "33ff33").cgColor)
        context.drawPath(using: .stroke)
        if (gridData.row == 0 && gridData.column == 0) {
            return
        }
        
    }
    //裁剪图片
    func clipImages(){
        let rowHeight = height(frame:self.frame)/((self.gridData.row > 0) ? CGFloat(self.gridData.row):1)
        let columnWidth = width(frame:self.frame)/((self.gridData.column > 0) ? CGFloat(self.gridData.column):1)
        for i in 0 ..< (self.gridData.row) {
            for j in 0 ..< self.gridData.column {
                let pframe = CGRect(x: CGFloat(i) * columnWidth, y: CGFloat(j) * rowHeight, width: columnWidth, height: rowHeight)
                guard let image = clipImageFromView(view: self, targetFrame: pframe) else {
                    continue
                }
                var imageData:NSData
                if let data = UIImagePNGRepresentation(image) {
                    imageData = data as NSData
                }else {
                    imageData = UIImageJPEGRepresentation(image, 1)! as NSData
                }
                
                let imageType = (UIImagePNGRepresentation(image) == nil) ? "jpg" : "png"
                var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] 
                
                path += "/" + String(i) + String(j) + "." + imageType
                NSLog("path : %@", path)
                imageData .write(toFile: path, atomically: true)
                
            }
        }
    }
    
}




























