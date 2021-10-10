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
    @IBOutlet weak var questionNum: UILabel!

    // integer equivalent to the currently selected option; equal to -1 if none is selected
    var currSelected: Int
    
    //reusablecell確認
    static var count = 0
    
    var id = 0
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        id = Self.count
        markTVC.count += 1
        print("[\(id)] 🔴\(#function)")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print("[\(id)]  🔵\(#function)")
//        //再利用されるタイミングでcellを初期化
//        markButtons.forEach({
//            $0.tintColor = .black
//            $0.backgroundColor = .white
//        })
     
    }
    
    //再利用されるたびに以下のメソッドが適用される
    func markDesign(){
        // Persist state passed in from data source
        for (index, button) in markButtons.enumerated() {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.cornerRadius = 22
            if index == currSelected {
                button.tintColor = .black
                button.backgroundColor = .white
            } else {
                button.tintColor = .white
                button.backgroundColor = .black
            }
        }
    }

    func handleStateChanged(tag: Int) {
        print("cell [handleStateChanged] function should be overridden from the data source")
    }
    
    //マーク機能
    @IBAction func markSelected(_ sender: UIButton) {
        handleStateChanged(sender.tag)

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
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        markDesign()
    }
}


