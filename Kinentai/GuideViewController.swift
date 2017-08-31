//
//  GuideViewController.swift
//  FireEmergency
//
//  Created by 中道忠和 on 2017/02/26.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController {
    //メイン画面
    let btnData         = UIButton(frame: CGRect.zero)
    let btnKinentai     = UIButton(frame: CGRect.zero)
    let pad1            = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let pad2            = UIView(frame: CGRect.zero)
    let pad3            = UIView(frame: CGRect.zero)
    let pad4            = UIView(frame: CGRect.zero)
    let btnGuide4       = UIButton(frame: CGRect.zero)
    let btnGuide5       = UIButton(frame: CGRect.zero)
    let padY1           = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let padY2           = UIView(frame: CGRect.zero)
    let padY3           = UIView(frame: CGRect.zero)
    let padY4           = UIView(frame: CGRect.zero)
    let padY5           = UIView(frame: CGRect.zero)
    let padY6           = UIView(frame: CGRect.zero)
    //別クラスのインスタンス保持用変数
    fileprivate var mInfoDialog: InfoDialog!
    fileprivate var mGuide44Dialog: Guide44Dialog!
    fileprivate var mGuide5Dialog: Guide5Dialog!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0)
        //Button生成
        //アプリの使用目的
        btnData.backgroundColor = UIColor.blue
        btnData.layer.masksToBounds = true
        btnData.setTitle("アプリの使用目的", for: UIControlState())
        btnData.setTitleColor(UIColor.white, for: UIControlState())
        btnData.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        btnData.layer.cornerRadius = 8.0
        btnData.tag = 0
        btnData.addTarget(self, action: #selector(self.showPurpose(_:)), for: .touchUpInside)
        btnData.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnData)
        //pad
        pad1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad1)
        pad2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad2)
        pad3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad3)
        pad4.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad4)
        //説明４
        btnGuide4.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnGuide4.layer.masksToBounds = true
        btnGuide4.setTitle("非常招集確認ボタン", for: UIControlState())
        btnGuide4.setTitleColor(UIColor.black, for: UIControlState())
        btnGuide4.translatesAutoresizingMaskIntoConstraints = false
        btnGuide4.addTarget(self, action: #selector(self.showGuide4(_:)), for: .touchUpInside)
        self.view.addSubview(btnGuide4)
        //説明５
        btnGuide5.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnGuide5.layer.masksToBounds = true
        btnGuide5.setTitle("情報確認ボタン", for: UIControlState())
        btnGuide5.setTitleColor(UIColor.black, for: UIControlState())
        btnGuide5.translatesAutoresizingMaskIntoConstraints = false
        btnGuide5.addTarget(self, action: #selector(self.showGuide5(_:)), for: .touchUpInside)
        self.view.addSubview(btnGuide5)
        //垂直方向のpad
        padY1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY1)
        padY2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY2)
        padY3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY3)
        padY4.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY4)
        padY5.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY5)
        padY6.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(padY6)
        //緊援隊
        btnKinentai.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentai.layer.masksToBounds = true
        btnKinentai.setTitle("緊援隊", for: UIControlState())
        btnKinentai.setTitleColor(UIColor.black, for: UIControlState())
        btnKinentai.tag=4
        btnKinentai.addTarget(self, action: #selector(self.onClickbtnKinentai(_:)), for: .touchUpInside)
        btnKinentai.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnKinentai)
        
        //ボタン押したら表示するDialog生成
        mInfoDialog = InfoDialog(parentView: self) //このViewControllerを渡してあげる
        mGuide44Dialog = Guide44Dialog(parentView: self)
        mGuide5Dialog = Guide5Dialog(parentView: self)
    }
    
    //制約ひな型
    func Constraint(_ item: AnyObject, _ attr: NSLayoutAttribute, to: AnyObject?, _ attrTo: NSLayoutAttribute, constant: CGFloat = 0.0, multiplier: CGFloat = 1.0, relate: NSLayoutRelation = .equal, priority: UILayoutPriority = UILayoutPriorityRequired) -> NSLayoutConstraint {
        let ret = NSLayoutConstraint(
            item:       item,
            attribute:  attr,
            relatedBy:  relate,
            toItem:     to,
            attribute:  attrTo,
            multiplier: multiplier,
            constant:   constant
        )
        ret.priority = priority
        return ret
    }
    
    override func viewDidLayoutSubviews(){
        //制約
        self.view.addConstraints([
            //アプリの使用目的ボタン
            Constraint(btnData, .top, to:self.view, .top, constant:20),
            Constraint(btnData, .leading, to:self.view, .leading, constant:8),
            Constraint(btnData, .trailing, to:self.view, .trailingMargin, constant:8)
            ])
        self.view.addConstraints([
            //padY1
            Constraint(padY1, .top, to:btnData, .bottom, constant:0),
            Constraint(padY1, .leading, to:self.view, .leading, constant:0),
            Constraint(padY1, .height, to:self.view, .height, constant:0, multiplier:0.05)
            ])
        self.view.addConstraints([
            //説明４ボタン
            Constraint(btnGuide4, .top, to:padY1, .bottom, constant:0),
            Constraint(btnGuide4, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnGuide4, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY6
            Constraint(padY6, .top, to:btnGuide4, .bottom, constant:0),
            Constraint(padY6, .leading, to:self.view, .leading, constant:0),
            Constraint(padY6, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //説明５ボタン
            Constraint(btnGuide5, .top, to:padY6, .bottom, constant:0),
            Constraint(btnGuide5, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnGuide5, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //緊援隊ボタン
            Constraint(btnKinentai, .top, to:btnGuide5, .bottom, constant:32),
            Constraint(btnKinentai, .leading, to:self.view, .leading, constant:8),
            Constraint(btnKinentai, .trailing, to:self.view, .trailingMargin, constant:8)
            ])
    }
    
    //参集アプリの使用目的
    func showPurpose(_ sender: UIButton){
        mInfoDialog.showInfo("purpose")
    }
    
    //説明４
    func showGuide4(_ sender: UIButton){
        mGuide44Dialog.showInfo()
    }
    
    //説明５
    func showGuide5(_ sender: UIButton){
        mGuide5Dialog.showInfo()
    }
    
    //緊援隊画面遷移
    func onClickbtnKinentai(_ sender : UIButton){
        let data:ViewController = ViewController()
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        self.present(nav, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
