//
//  GPNewGameViewController.swift
//  momodaJigsaw
//
//  Created by lignpeng on 17/4/1.
//  Copyright © 2017年 lignpeng. All rights reserved.
//

import UIKit

class GPNewGameViewController: UIViewController {
    var imageView:UIImageView!
    var iframe:CGRect = CGRect()
    var gridView:GPGridView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    func initView() {
        self.view.backgroundColor = UIColor.init(hexColor: "ccff99")
//        let marginWidth:CGFloat = 64
        guard let image = UIImage.init(named: "9.jpg") else {
            NSLog("没有选择图片")
            return
        }
        
        let imageSize = scaleImageSize(size: image.size)
        
        
        let marginWidth = (kScreenWidth - imageSize.width) * 0.5
        self.iframe = CGRect(x:marginWidth,y:64 + 8,width:imageSize.width,height:imageSize.height)
        self.imageView = UIImageView.init(frame: self.iframe)
        self.imageView.isUserInteractionEnabled = true
        let gestrue = UITapGestureRecognizer(target: self, action: #selector(GPNewGameViewController.selectImageAction))
        self.imageView.addGestureRecognizer(gestrue)
        gestrue.numberOfTapsRequired = 1
        self.imageView.image = image
        self.view.addSubview(self.imageView)
        self.gridView = GPGridView(frame: self.iframe.insetBy(dx: -2, dy: -2))
        self.gridView.updateGridView(gridData: (row: 2 , column: 3, frame: self.iframe.insetBy(dx: -2, dy: -2)))
        self.view.addSubview(self.gridView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "保存", style: .plain, target: self, action: #selector(saveClipImages))
    }
    
    func selectImageAction() -> UIImage {
        NSLog("选择图片")
        let image = UIImage.init(named: "8")!
        
        return image
    }
    
    func saveClipImages() {
        self.gridView.clipImages()
    }

}
