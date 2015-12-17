//
//  NotTableViewCell.swift
//  Telas
//
//  Created by Student on 12/14/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class NotTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNomeTutorial: UILabel!
    @IBOutlet weak var labelAutor: UILabel!
    @IBOutlet weak var labelPublicado: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
