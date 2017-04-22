//
//  GPMainViewController.swift
//  momodaJigsaw
//
//  Created by lignpeng on 17/3/29.
//  Copyright © 2017年 lignpeng. All rights reserved.
//

import UIKit

class GPMainViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var collectionView:UICollectionView!
    var dataSource:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        self.title = "momoda Jigsaw"
        initView()
    }
    
    func initView() {
        let layout = UICollectionViewFlowLayout()
        let margin:CGFloat = 8.0
        let number:CGFloat = 3;
        let width = (kScreenWidth - (number + 1)  * margin) / number
        layout.itemSize = CGSize(width:width , height: width * 1.2)
        layout.minimumInteritemSpacing = margin
        layout.minimumLineSpacing = margin * 1.5
        layout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = UIColor.white
        self.collectionView.register(UINib(nibName:(NSStringFromClass(GPMainCollectionViewCell.self) as NSString).pathExtension,bundle:nil), forCellWithReuseIdentifier:NSStringFromClass(GPMainCollectionViewCell.self))
        self.view.addSubview(self.collectionView)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem:.add, target: self, action: #selector(GPMainViewController.addNewJigsaw))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "管理", style: .plain, target: self, action: #selector(GPMainViewController.managerJigsaw))
    }
    //添加新的拼图
    func addNewJigsaw() {
        NSLog("添加新的拼图")
        let newGame = GPNewGameViewController()
        self.navigationController?.hidesBottomBarWhenPushed = true
//        self.navigationController?.hidesBarsOnTap = true
        self.navigationController?.pushViewController(newGame, animated: true)
    }
    //管理拼图
    func managerJigsaw() {
        NSLog("管理拼图")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:GPMainCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(GPMainCollectionViewCell.self), for: indexPath) as! GPMainCollectionViewCell
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        NSLog("%d", indexPath.row)
        self.addNewJigsaw()
        
    }
}
