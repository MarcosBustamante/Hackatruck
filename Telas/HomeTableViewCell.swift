//
//  HomeTableViewCell.swift
//  Telas
//
//  Created by Student on 12/14/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var labelNomeTutorial: UILabel!
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelVistoPor: UILabel!
    @IBOutlet weak var labelCurtidoPor: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
