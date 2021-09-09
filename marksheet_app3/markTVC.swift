//
//  markTVC.swift
//  marksheet_app3
//
//  Created by Ren Miyamoto on 2021/09/08.
//

import UIKit

class markTVC: UITableViewCell {

    @IBOutlet weak var markView: UIStackView!
    
    @IBOutlet var markButtons: [UIButton]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
