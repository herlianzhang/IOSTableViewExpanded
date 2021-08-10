//
//  SectionTableViewCell.swift
//  IOSExpandedTableView
//
//  Created by Ripin Li on 09/08/21.
//  Copyright © 2021 Herlian Zhang. All rights reserved.
//

import UIKit

class SectionTableViewCell: UITableViewCell {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
