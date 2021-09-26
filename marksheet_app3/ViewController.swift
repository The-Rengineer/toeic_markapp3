//
//  ViewController.swift
//  Contacts
//
//  Created by Ren Miyamoto on 2021/09/07.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    //タイマー機能
    var time: [Int] = [05,00]
    //Timer#scheduledTimerの値を共通して保持できる
    var timers = Timer()
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func startCount(_ sender: Any) {
        //startButtonの文字がStart or Restartならカウントダウン、startButtonをStopへ
        if startButton.titleLabel?.text == "Start" || startButton.titleLabel?.text == "Restart" {
            timers = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(timer) , userInfo: nil, repeats: true)
            startButton.setTitle("Stop", for: .normal)
            //その他は時間を止めて、startButtonをRestartへ
        } else {
            timers.invalidate()
            timers = Timer()
            startButton.setTitle("Restart", for: .normal)
        }
    }
    
    @IBAction func resetConfig(_ sender: Any) {
        //タイマーの破棄
        timers.invalidate()
        timers = Timer()
        //アラート表示
        let alert: UIAlertController = UIAlertController(title: "タイマーをリセットしますか？", message: "", preferredStyle:  UIAlertController.Style.alert)
        //OKが押下されたらリセットをかける
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            self.reset()
        })
        //キャンセルが押下されたらStop -> Restart
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
            (action: UIAlertAction!) -> Void in
            self.startButton.setTitle("Restart", for: .normal)
        })
        //アラートボタンのセットと表示
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    //マーク機能
    @IBOutlet var tableView: UITableView!
    let totalQuestionNum = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = stringtime().text
        startButton.layer.cornerRadius = 10
        resetButton.layer.cornerRadius = 10
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func timer(){
        //残り時間がなくなったら、アラートを出し、時間を元に戻す。startButtonをStartへ
        if (time[0] == 0 && time[1] == 0) {
            //時間切れのアラートを出す
            let alert = alertMessage(alertMessage: "Time Up!")
            let defaultAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(defaultAction)
            present(alert, animated: true, completion: nil)
            //タイマーを初期値に戻し、startButtonをStartへ
            reset()
        } else {
            if time[1] > 0 {
                //秒数が0以上の時秒数を-1
                time[1] -= 1
            } else {
                //秒数が0の時
                time[1] += 59
                if time[0] > 0 {
                    //分が0以上の時、分を-1
                    time[0] -= 1
                } else {
                    //分が０の時、+59分、時間-1
                    time[1] += 59
                    time[0] = 0
                }
            }
            timeLabel.text = stringtime().text
        }
    }
    //残り秒数の桁落ち防止メソッド、実は引数いらないんじゃね？
    func stringtime()-> UILabel{
        var Stringtime0 = String(time[0])
        var Stringtime1 = String(time[1])
        
        if Stringtime0.count == 1 {
            Stringtime0 = "0" + Stringtime0
        }
        if Stringtime1.count == 1 {
            Stringtime1 = "0" + Stringtime1
        }
        
        timeLabel.text = Stringtime0 + ":" + Stringtime1
        
        return timeLabel
    }
    
    func reset(){
        //タイマーを初期値に戻し、startButtonをStartへ
        timers.invalidate()
        timers = Timer()
        time = [05,00]
        timeLabel.text = stringtime().text
        startButton.setTitle("Start", for: .normal)
    }
    
    func alertMessage(alertMessage: String) -> UIAlertController {
        return UIAlertController(title: alertMessage, message: "", preferredStyle:  UIAlertController.Style.alert)
    }
}

//マーク機能
extension ViewController: UITableViewDataSource {
    
    //画面に表示するセル(リスト)の数を指定 == 100問
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalQuestionNum
    }
    
    //セルに値を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //markTVC.swiftからcellを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! markTVC
        
        //markTVCのlabelを取得し、セルの数だけ番号を順にふる（文字列へ変換含む）
        
        let questionIndexNum:String = String(indexPath.row + 1)
        cell.questionNum.text = questionIndexNum
        
        //print(indexPath.row + 1)
        print(questionIndexNum)
        
        //cellの背景を1行おきに白とグレーにする
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor(named: "firstCellBGC")
        } else {
            cell.backgroundColor = .white
        }
        
        cell.markDesign()
        return cell
    }
}

