//
//  ListTableViewCell.swift
//  kaomoji
//
//  Created by 笠原未来 on 2017/08/01.
//  Copyright © 2017年 笠原未来. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet var faceButton: UIButton!
    @IBOutlet var kaomojiLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
