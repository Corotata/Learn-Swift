//
//  HomeTableViewCell.swift
//  News
//
//  Created by Corotata on 2017/1/20.
//  Copyright © 2017年 Corotata. All rights reserved.
//

import UIKit
import Kingfisher
class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var replyCountLabel: UILabel!
    
    var news : News?{
        didSet {
            let url = URL(string: news?.imgsrc ?? "")
            iconImageView.kf.setImage(with: url)
            
            titleLabel.text = news?.title
            sourceLabel.text = news?.source
            replyCountLabel.text = "\(news?.replyCount ?? 0)跟帖"
        }
    
    }
}
