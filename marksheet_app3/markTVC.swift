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
    
    //reusablecellç¢ºèª
    static var count = 0
    
    var id = 0
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        id = Self.count
        markTVC.count += 1
        print("[\(id)] ð´\(#function)")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        print("[\(id)]  ðµ\(#function)")
//        //åå©ç¨ãããã¿ã¤ãã³ã°ã§cellãåæå
//        markButtons.forEach({
//            $0.tintColor = .black
//            $0.backgroundColor = .white
//        })
     
    }
    
    //åå©ç¨ããããã³ã«ä»¥ä¸ã®ã¡ã½ãããé©ç¨ããã
    func markDesign(){
        markButtons.forEach({
            $0.tintColor = .black
            $0.backgroundColor = .white
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.cornerRadius = 22
        })
    }
    
    //ãã¼ã¯æ©è½
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
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        markDesign()
    }
}


