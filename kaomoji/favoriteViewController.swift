//
//  jisyoViewController.swift
//  kaomozi
//
//  Created by 笠原未来 on 2017/07/16.
//  Copyright © 2017年 笠原未来. All rights reserved.
//

import UIKit
import BTNavigationDropdownMenu

class favoriteViewController: UIViewController, UITableViewDataSource ,UITabBarDelegate, UITableViewDelegate{
    
    // StoryBoardで扱うTableviewを宣言
    @IBOutlet var table: UITableView!
    
    var menuView: BTNavigationDropdownMenu!
    
    
    //足した
    var saveArray = [String]()
    var saveData = UserDefaults.standard
    
    var emotionArray = [Int]()
    var saveEmotion = UserDefaults.standard
    
    // 表情別の配列
    var smileArray = [Int]()
    var smileSaveArray: [String] = []
    
    var cryArray = [Int]()
    var crySaveArray = [String]()
    
    var angryArray = [Int]()
    var angrySaveArray = [String]()
    
    var surpriseArray = [Int]()
    var surpriseSaveArray = [String]()
    
    var menuIndex: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Tableviewのデータソースメソッドはviewcontrollerクラスに書くよ、という設定
        table.delegate = self
        table.dataSource = self
        
        table.register(UINib(nibName: "ListTableViewCell", bundle: nil),forCellReuseIdentifier: "cell")
        
        let items = ["新着順", "古い順","笑い","泣き","怒り","驚き"]
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.0/255.0, green:188/255.0, blue:220/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        

        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: "並び替え", items: items )
        
        menuView.cellHeight = 50
        menuView.cellBackgroundColor = self.navigationController?.navigationBar.barTintColor
        menuView.cellSelectionColor = UIColor(red: 0.0/255.0, green:160.0/255.0, blue:195.0/255.0, alpha: 1.0)
        menuView.shouldKeepSelectedCellColor = true
        menuView.cellTextLabelColor = UIColor.white
        menuView.cellTextLabelFont = UIFont(name: "Avenir-Heavy", size: 17)
        menuView.cellTextLabelAlignment = .left // .Center // .Right // .Left
//        menuView.arrowPadding = 15
        menuView.animationDuration = 0.5
        menuView.maskBackgroundColor = UIColor.black
        menuView.maskBackgroundOpacity = 0.3
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> Void in
            // 選択した時の命令
            
            print("Did select item at index: \(indexPath)")
            
            if indexPath == 0{
                self.menuIndex = 0
                
            }else if indexPath == 1{
                self.menuIndex = 1
                
            }else if indexPath == 2 {
                self.menuIndex = 2
                self.smileArray.removeAll(keepingCapacity: true)
                self.smileSaveArray.removeAll(keepingCapacity: true)
                for (index, emotion) in self.emotionArray.enumerated() {
                    if emotion == 1 {
                        // 1番のときは最初に入れる
                        self.smileArray.insert(emotion, at: 0)
                        // emotionArrayとsaveArrayの中身を対応させる
                        self.smileSaveArray.insert(self.saveArray[index], at: 0)
                    }else{
                        // それ以外は後ろに入れる
                        self.smileArray.append(emotion)
                        self.smileSaveArray.append(self.saveArray[index])
                    }
                }
            }else if indexPath == 3{
                self.menuIndex = 3
                for (index, emotion) in self.emotionArray.enumerated() {
                    if emotion == 2 {
                        self.cryArray.insert(emotion, at: 0)
                        self.crySaveArray.insert(self.saveArray[index], at: 0)
                    }else{
                        self.cryArray.append(emotion)
                        self.crySaveArray.append(self.saveArray[index])
                    }
                }
            }else if indexPath == 4 {
                self.menuIndex = 4
                for (index, emotion) in self.emotionArray.enumerated() {
                    if emotion == 3 {
                        self.angryArray.insert(emotion, at: 0)
                        self.angrySaveArray.insert(self.saveArray[index], at: 0)
                    }else{
                        self.angryArray.append(emotion)
                        self.angrySaveArray.append(self.saveArray[index])
                    }
                }
            }else if indexPath == 5 {
                self.menuIndex = 5
                for (index, emotion) in self.emotionArray.enumerated() {
                    if emotion == 4 {
                        self.surpriseArray.insert(emotion, at: 0)
                        self.surpriseSaveArray.insert(self.saveArray[index], at: 0)
                    }else{
                        self.surpriseArray.append(emotion)
                        self.surpriseSaveArray.append(self.saveArray[index])
                    }
                }
            }
            self.table.reloadData()
            // Do any additional setup after loading the view, typically from a nib.
        }
        self.navigationItem.titleView = menuView
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if saveData.object(forKey: "save") != nil {
            saveArray = saveData.object(forKey: "save") as! [String]
        }else{
            
        }
        table.reloadData()
        print("\(saveArray)を読み込み3")
        
        if saveEmotion.object(forKey: "emotion") != nil {
            emotionArray = saveEmotion.object(forKey: "emotion") as! [Int]
        }else{
            print("else")
        }
        menuIndex = 0
        menuView.setSelected(index: 0)
        table.reloadData()
        print("\(emotionArray)を読み込み3表情")
        
        
        
    }
    
    
    func indexToEmotion(index: Int) -> String {
        if index == 1 {
            return "😁"
        }else if index == 2 {
            return "😭"
        }else if index == 3 {
            return "😠"
        }else if index == 4 {
            return "😲"
        }else{
            return "○"
        }
    }
    
    func indexToColor(index: Int) -> UIColor {
        if index == 1 {
            return UIColor(red: 0.0/255.0, green: 220/255.0, blue: 142/255.0, alpha: 0.1)
        }else if index == 2{
            return UIColor(red: 0.0/255.0, green:123/255.0, blue:144/255.0, alpha: 0.1)
        }else if index == 3{
            return UIColor(red: 200.0/255.0, green:0/255.0, blue:78/255.0, alpha: 0.1)
        }else if index == 4{
            return UIColor(red: 246.0/255.0, green:220/255.0, blue:0/255.0, alpha: 0.1)
        }else{
            return UIColor.white
        }
    }
    
    
    
    // セクション数を指定(Cellのかたまりの数)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    // セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saveArray.count
    }
    
    // ID付きのセルを取得して、セル付属のtextlabelに表示させる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath) as! ListTableViewCell
        
        if menuIndex == 0{
            cell.kaomojiLabel?.text = saveArray[indexPath.row]
            // 選択した行の番号を取得して、表情の絵文字に変換する
            cell.faceButton.setTitle(indexToEmotion(index: emotionArray[indexPath.row]), for: .normal)
            cell.backgroundColor = indexToColor(index: emotionArray[indexPath.row])
        }else if menuIndex == 1{
            cell.kaomojiLabel?.text = saveArray.reversed()[indexPath.row]
            cell.faceButton.setTitle(indexToEmotion(index: emotionArray.reversed()[indexPath.row]), for: .normal)
            cell.backgroundColor = indexToColor(index: emotionArray.reversed()[indexPath.row])
        }else if menuIndex == 2{
            cell.kaomojiLabel?.text = smileSaveArray[indexPath.row]
            cell.faceButton.setTitle(indexToEmotion(index: smileArray[indexPath.row]), for: .normal)
            cell.backgroundColor = indexToColor(index: smileArray[indexPath.row])
        }else if menuIndex == 3{
            cell.kaomojiLabel?.text = crySaveArray[indexPath.row]
            cell.faceButton.setTitle(indexToEmotion(index: cryArray[indexPath.row]), for: .normal)
            cell.backgroundColor = indexToColor(index: cryArray[indexPath.row])
        }else if menuIndex == 4{
            cell.kaomojiLabel?.text = angrySaveArray[indexPath.row]
            cell.faceButton.setTitle(indexToEmotion(index: angryArray[indexPath.row]), for: .normal)
            cell.backgroundColor = indexToColor(index: angryArray[indexPath.row])
        }else if menuIndex == 5{
            cell.kaomojiLabel?.text = surpriseSaveArray[indexPath.row]
            cell.faceButton.setTitle(indexToEmotion(index: surpriseArray[indexPath.row]), for: .normal)
            cell.backgroundColor = indexToColor(index: surpriseArray[indexPath.row])
        }else{
            cell.kaomojiLabel?.text = saveArray[indexPath.row]
            cell.faceButton.setTitle(indexToEmotion(index: emotionArray[indexPath.row]), for: .normal)
            cell.backgroundColor = indexToColor(index: emotionArray[indexPath.row])
        }
        
//        cell.faceButton.addTarget(self, action: #selector(faceChange(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    //    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    //        if editingStyle == .delete {
    //            saveArray.remove(at: indexPath.row)
    //            tableView.deleteRows(at: [indexPath], with: .fade)
    //        }else{
    //
    //        }
    //        saveData.set(saveArray, forKey: "save")
    //        print(saveArray)
    //    }
    
    
    
    // Cellのスワイプメソッドを実装
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteCellButton = UITableViewRowAction(style: .default, title: " 削除　") { action, index in
            self.deleteCell(content: "削除", index: index.row) // 押されたときの動きを定義
        }
        let copyCellButton = UITableViewRowAction(style: .default, title: "コピー") { action, index in
            self.copyCell(content: "コピー", index: index.row)
        }
        
        // 背景色
        deleteCellButton.backgroundColor = UIColor(red: 200.0/255.0, green:0/255.0, blue:78/255.0, alpha: 1.0)
        copyCellButton.backgroundColor = UIColor(red: 0.0/255.0, green:166/255.0, blue:195/255.0, alpha: 1.0)
        
        
        return [deleteCellButton, copyCellButton] // deleteCellから順に表示される
    }
    
    // trueを返すことでCellのアクションを許可
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    // ボタンを押したときのメソッド
    func deleteCell(content: String, index: Int) {
        saveArray.remove(at: index)
        table.reloadData()
        saveData.set(saveArray, forKey: "save")
        print(saveArray)
        
        emotionArray.remove(at: index)
        table.reloadData()
        saveEmotion.set(emotionArray, forKey: "emotion")
        print("表情消した")
    }
    
    func copyCell(content: String, index: Int) {
        let pasteboard = UIPasteboard.general
        
        // 文字列をコピーする
        pasteboard.setValue(saveArray[index], forPasteboardType: "public.text")
        
        //アラートを出す
        let alert: UIAlertController = UIAlertController(title: saveArray[index], message: "コピーしました", preferredStyle: .alert)
        
        //OKボタン
        alert.addAction(
            UIAlertAction(title: "OK",
                          style: UIAlertActionStyle.default,
                          handler: { action in
            }
            )
        )
        present(alert,animated: true, completion: nil)
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
