//
//  ViewController.swift
//  Contacts
//
//  Created by Ren Miyamoto on 2021/09/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    //問題数
    let totalQuestionNum = 100
    var questionIndexNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me!")
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalQuestionNum
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! markTVC
        
        //the index number for each questions as labels
        questionIndexNum += 1
        let qNumStr:String = String(questionIndexNum)
        cell.questionNum.text = qNumStr
        
        
        //add default style of cell not markButtons themselves
        for i in 0 ..< cell.markButtons.count {
            cell.markButtons[i].layer.borderWidth = 1
            cell.markButtons[i].layer.borderColor = UIColor.black.cgColor
            cell.markButtons[i].layer.cornerRadius = 22
        }
        return cell
    }
}

