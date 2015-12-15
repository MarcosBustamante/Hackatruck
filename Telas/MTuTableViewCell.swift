//
//  MTuTableViewCell.swift
//  Telas
//
//  Created by Student on 12/14/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class MTuTableViewCell: UITableViewCell {

    @IBOutlet weak var labelPublicado: UILabel!
    @IBOutlet weak var labelNomeTutorial: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
