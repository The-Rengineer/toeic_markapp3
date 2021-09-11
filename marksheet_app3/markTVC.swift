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
        //add default style of markButtons themselves
        markButtons.forEach({
            $0.tintColor = .black
            $0.backgroundColor = .white
        })
    }
        
    //マーク機能
    @IBAction func markSelected(_ sender: UIButton) {
        
        if sender.tintColor == .black && sender.backgroundColor == .white {
            markButtons.forEach({
                $0.tintColor = .black
                $0.backgroundColor = .white
            })
            sender.tintColor = .white
            sender.backgroundColor = .black
        } else if sender.tintColor == .white && sender.backgroundColor == .black {
            markButtons.forEach({
                $0.tintColor = .black
                $0.backgroundColor = .white
            })
            sender.tintColor = .black
            sender.backgroundColor = .white
        }
    }
}
