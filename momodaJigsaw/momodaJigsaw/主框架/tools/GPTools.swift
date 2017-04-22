//
//  GPTools.swift
//  momodaJigsaw
//
//  Created by lignpeng on 17/4/1.
//  Copyright © 2017年 lignpeng. All rights reserved.
//

import UIKit
let imageSize:CGSize = CGSize(width:145,height:240)

let imageWidth = kScreenWidth - 64

let imageHeight = imageWidth * 1.2


func scaleImageSize(size:CGSize) -> CGSize {
    var scale:CGFloat = 1
    if (size.width > size.height) {
        scale = imageWidth / size.width
    }else {
        scale = imageHeight / size.height
    }
    
//    let verticalRadio = imageSize.height / size.height
//    let horizontalRadio = imageSize.width / size.width
//    
//    if (verticalRadio > 1 && horizontalRadio > 1) {
//        scale = verticalRadio > horizontalRadio ? horizontalRadio : verticalRadio
//    }else {
//        scale = verticalRadio < horizontalRadio ?  verticalRadio : horizontalRadio
//    }
    
    return CGSize(width: size.width * scale, height: size.height * scale)
}

//获得某个范围内的屏幕图像
func clipImageFromView(view:UIView,targetFrame:CGRect) -> UIImage? {
    UIGraphicsBeginImageContext(size(object:view))
    guard let context = UIGraphicsGetCurrentContext() else {
        return nil
    }
    context.saveGState();
    UIRectClip(targetFrame)
    guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
        return nil
    }
    UIGraphicsEndImageContext();
    return image
}


//func createFileName() -> String {
//    char data[32];
//    for (int x=0;x<32;data[x++] = (char)('A' + (arc4random_uniform(26))));
//    return [[NSString alloc] initWithBytes:data length:32 encoding:NSUTF8StringEncoding];
//}
