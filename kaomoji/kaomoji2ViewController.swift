//
//  Kaomozi2ViewController.swift
//  kaomozi
//
//  Created by 笠原未来 on 2017/07/02.
//  Copyright © 2017年 笠原未来. All rights reserved.
//

import UIKit
import BTNavigationDropdownMenu
import Accounts

class kaomoji2ViewController: UIViewController {
    
    var menuView: BTNavigationDropdownMenu!
    
    @IBOutlet var leftKaoLavel: UILabel!
    @IBOutlet var leftPartsLabel: UILabel!
    @IBOutlet var leftEyeLabel: UILabel!
    @IBOutlet var kutiLabel: UILabel!
    @IBOutlet var rightEyeLabel: UILabel!
    @IBOutlet var rightPartsLabel: UILabel!
    @IBOutlet var rightKaoLabel: UILabel!
    @IBOutlet var kanseiLabel: UILabel!
    
    @IBOutlet var createButton: UIButton!
    @IBOutlet var copyButton: UIButton!
    @IBOutlet var shareButton: UIButton!
    
    @IBOutlet weak var save: UIButton!
    var kansei = String()
    
    var menuIndex: Int = 0
    
    let leftPartsArray: [String] = ["⊃","∩","* ",";","∪"]
    let leftEyeArray: [String] = ["^",">","`","★","'","T","・","°","δ","－"]
    let kutiArray: [String] = ["v","A","X","=","o","-","８","ω","▼","p","ᴗ","⊥","Д"]
    let rightEyeArray: [String] = ["^","<","★","'","`","T","・","°","δ","－"]
    let rightPartsArray: [String] = ["⊂","∩","*"," ;","∪"]
    
    //足したたっティー
    var saveArray = [String]()
    let saveData = UserDefaults.standard
    
    var emotionArray = [Int]()
    let saveEmotion = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButton.layer.cornerRadius = 5.0
        copyButton.layer.cornerRadius = 5.0
        shareButton.layer.cornerRadius = 5.0
        save.layer.cornerRadius = 5.0
        kanseiLabel.layer.cornerRadius = 5.0
        kanseiLabel.clipsToBounds = true
        
        //足したたっティー
        //        if saveData.object(forKey: "save") != nil {
        //        saveArray = saveData.object(forKey: "save") as! [String]
        //
        //        }else{
        //
        //        }
        //        print("\(saveArray)を読み込み")
        
        //        let viewcontrollerArray = [ViewController.self,Kaomozi2ViewController.self]
        
        //let stroyboard: UIStoryboard = self.storyboard!
        //let nextView = stroyboard.instantiateViewController(withIdentifier: "first") as! ViewController
        //        let nextView = stroyboard.instantiateViewController(withIdentifier: "next") as! Kaomozi2ViewController
        
        let items = ["ランダム","笑い", "泣き", "怒り","驚き"]
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.0/255.0, green:188/255.0, blue:220/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: "表情", items: items as [AnyObject])
        
        menuView.cellHeight = 50
        menuView.cellBackgroundColor = self.navigationController?.navigationBar.barTintColor
        menuView.cellSelectionColor = UIColor(red: 0.0/255.0, green:160.0/255.0, blue:195.0/255.0, alpha: 1.0)
        menuView.shouldKeepSelectedCellColor = true
        menuView.cellTextLabelColor = UIColor.white
        menuView.cellTextLabelFont = UIFont(name: "Avenir-Heavy", size: 17)
        menuView.cellTextLabelAlignment = .left // .Center // .Right // .Left
        menuView.arrowPadding = 15
        menuView.animationDuration = 0.5
        menuView.maskBackgroundColor = UIColor.black
        menuView.maskBackgroundOpacity = 0.3
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> Void in
            // 選択した時の命令
            
            print("Did select item at index: \(indexPath)")
            
            if indexPath == 0{
                self.menuIndex = 0
                
                let rgba0 = UIColor(red: 0.0/255.0, green:188/255.0, blue:220/255.0, alpha: 1.0)
                self.navigationController?.navigationBar.barTintColor = rgba0
                self.menuView.cellSelectionColor = rgba0
                self.menuView.cellBackgroundColor = rgba0
                self.createButton.backgroundColor = rgba0
                self.copyButton.backgroundColor = rgba0
                self.save.backgroundColor = rgba0
                self.shareButton.backgroundColor = rgba0
                
            }else if indexPath == 1{
                self.menuIndex = 1
                
                let rgba = UIColor(red: 0.0/255.0, green: 220/255.0, blue: 142/255.0, alpha: 1.0)
                self.navigationController?.navigationBar.barTintColor = rgba
                self.menuView.cellSelectionColor = rgba
                self.menuView.cellBackgroundColor = rgba
                self.createButton.backgroundColor = rgba
                self.copyButton.backgroundColor = rgba
                self.save.backgroundColor = rgba
                self.shareButton.backgroundColor = rgba
                
            }else if indexPath == 2{
                self.menuIndex = 2
                
                let rgba2 = UIColor(red: 0.0/255.0, green:123/255.0, blue:144/255.0, alpha: 1.0)
                self.navigationController?.navigationBar.barTintColor = rgba2
                self.menuView.cellSelectionColor = rgba2
                self.menuView.cellBackgroundColor = rgba2
                self.createButton.backgroundColor = rgba2
                self.copyButton.backgroundColor = rgba2
                self.save.backgroundColor = rgba2
                self.shareButton.backgroundColor = rgba2
                
                
            }else if indexPath == 3{
                
                self.menuIndex = 3
                
                let rgba3 = UIColor(red: 200.0/255.0, green:0/255.0, blue:78/255.0, alpha: 1.0)
                self.navigationController?.navigationBar.barTintColor = rgba3
                self.menuView.cellSelectionColor = rgba3
                self.menuView.cellBackgroundColor = rgba3
                self.createButton.backgroundColor = rgba3
                self.copyButton.backgroundColor = rgba3
                self.save.backgroundColor = rgba3
                self.shareButton.backgroundColor = rgba3
                
                
            }else if indexPath == 4{
                
                self.menuIndex = 4
                let rgba4 = UIColor(red: 246.0/255.0, green:220/255.0, blue:0/255.0, alpha: 1.0)
                self.navigationController?.navigationBar.barTintColor = rgba4
                self.menuView.cellSelectionColor = rgba4
                self.menuView.cellBackgroundColor = rgba4
                self.createButton.backgroundColor = rgba4
                self.copyButton.backgroundColor = rgba4
                self.save.backgroundColor = rgba4
                self.shareButton.backgroundColor = rgba4
                
            }

            
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
        print("\(saveArray)を読み込み2")
        
        if saveEmotion.object(forKey: "emotion") != nil {
            emotionArray = saveEmotion.object(forKey: "emotion") as! [Int]
        }else{
            
        }
        print("\(emotionArray)を読み込み2表情")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func create() {
        
        let leftPartsIndex = Int(arc4random_uniform(5))
        let leftEyeIndex = Int(arc4random_uniform(10))
        let kutiIndex = Int(arc4random_uniform(13))
        let rightEyeIndex = Int(arc4random_uniform(10))
        let rightPartsIndex = Int(arc4random_uniform(5))
        
        leftPartsLabel.text = leftPartsArray[leftPartsIndex]
        leftEyeLabel.text = leftEyeArray[leftEyeIndex]
        kutiLabel.text = kutiArray[kutiIndex]
        rightEyeLabel.text = rightEyeArray[rightEyeIndex]
        rightPartsLabel.text = rightPartsArray[rightPartsIndex]
        
        if menuIndex == 1 {
            rightEyeLabel.text = String("^")
            leftEyeLabel.text = String("^")
            kansei = "( " + leftPartsArray[leftPartsIndex] + " " + "^" + " " + kutiArray[kutiIndex] + " " + "^" + " " + rightPartsArray[rightPartsIndex] + " )"
        }else if menuIndex == 2 {
            rightEyeLabel.text = String("T")
            leftEyeLabel.text = String("T")
            kansei = "( " + leftPartsArray[leftPartsIndex] + " " + "T" + " " + kutiArray[kutiIndex] + " " + "T" + " " + rightPartsArray[rightPartsIndex] + " )"
        }else if menuIndex == 3{
            rightEyeLabel.text = String("´")
            leftEyeLabel.text = String("｀")
            kansei = "( " + leftPartsArray[leftPartsIndex] + " " + "`" + " " + kutiArray[kutiIndex] + " " + "´" + " " + rightPartsArray[rightPartsIndex] + " )"
        }else if menuIndex == 4 {
            rightEyeLabel.text = String("°")
            leftEyeLabel.text = String("°")
            kutiLabel.text = String("A")
            kansei = "( " + leftPartsArray[leftPartsIndex] + " " + "°" + " " + "A" + " " + "°" + " " + rightPartsArray[rightPartsIndex] + " )"
            
        }else{
            kansei = "( " + leftPartsArray[leftPartsIndex] + " " + leftEyeArray[leftEyeIndex] + " " + kutiArray[kutiIndex] + " " + rightEyeArray[rightEyeIndex] + " " + rightPartsArray[rightPartsIndex] + " )"
        }
        
        
        kanseiLabel.text = String(kansei)
        
    }
    
    @IBAction func copyText() {
        
        let pasteboard = UIPasteboard.general
        
        // 文字列をコピーする
        pasteboard.setValue(kansei, forPasteboardType: "public.text")
        
        //アラートを出す
        let alert: UIAlertController = UIAlertController(title: kansei, message: "コピーしました", preferredStyle: .alert)
        
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
    
    @IBAction func shareSNS() {
        
        // 投稿する時に一緒に載せるコメント
        let shareText = "\(kansei) ＜顔文字作ったよ！"
        
        // 投稿するコメントと画像の準備
        let activityItems: [Any] = [shareText]
        
        let activityViewController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        let excludedActivityTypes = [UIActivityType.postToWeibo]
        
        activityViewController.excludedActivityTypes = excludedActivityTypes
        
        present(activityViewController, animated: true, completion: nil)
        
    }
    
    
    //足したたっティー
    
    @IBAction func savekaomozi(){
        // appendしてから保存しないと、今までのデータに上書きされて前のデータが消えてしまう
        saveArray.append(kansei)
        saveData.set(saveArray, forKey:"save")
        
        emotionArray.append(menuIndex)
        saveEmotion.set(emotionArray, forKey: "emotion")
        
        let alert: UIAlertController = UIAlertController(title: kansei, message: "お気に入りに追加しました", preferredStyle: .alert)
        
        //OKボタン
        alert.addAction(
            UIAlertAction(title: "OK",
                          style: UIAlertActionStyle.default,
                          handler: { action in
            }
            )
        )
        present(alert,animated: true, completion: nil)
        
        print("\(saveArray)を追加")
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
