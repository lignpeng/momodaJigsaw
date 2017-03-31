//
//  GPMainCollectionViewCell.swift
//  momodaJigsaw
//
//  Created by lignpeng on 17/3/30.
//  Copyright © 2017年 lignpeng. All rights reserved.
//

import UIKit

class GPMainCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var playTimeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
    }
    
    func initView() {
        self.nameLabel.text = ""
        self.levelLabel.text = ""
        self.playTimeLabel.text = ""
        self.backgroundColor = UIColor.init(hexColor: "ffcc00")
    }
    
    func configMainCollectionViewCell() {
        
    }
    
    
}
