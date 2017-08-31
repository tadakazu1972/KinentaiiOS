//
//  ViewController.swift
//  Kinentai
//
//  Created by 中道忠和 on 2017/07/30.
//  Copyright © 2017年 tadakazu nakamichi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //メイン画面
    let btnData         = UIButton(frame: CGRect.zero)
    let btnKinentai     = UIButton(frame: CGRect.zero)
    let pad1            = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let pad2            = UIView(frame: CGRect.zero)
    let pad3            = UIView(frame: CGRect.zero)
    let pad4            = UIView(frame: CGRect.zero)
    let lblKinentai     = UILabel(frame: CGRect.zero)
    let btnKinentai1    = UIButton(frame: CGRect.zero)
    let btnKinentai2    = UIButton(frame: CGRect.zero)
    let btnKinentai3    = UIButton(frame: CGRect.zero)
    let btnKinentai4    = UIButton(frame: CGRect.zero)
    let btnKinentai5    = UIButton(frame: CGRect.zero)
    let padY1           = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let padY2           = UIView(frame: CGRect.zero)
    let padY3           = UIView(frame: CGRect.zero)
    let padY4           = UIView(frame: CGRect.zero)
    let padY5           = UIView(frame: CGRect.zero)
    let padY6           = UIView(frame: CGRect.zero)
    let btnKinentaiEarthquake = UIButton(frame: CGRect.zero)
    let btnKinentaiBlackout   = UIButton(frame: CGRect.zero)
    let btnKinentaiRoad       = UIButton(frame: CGRect.zero)
    let btnKankeikikan        = UIButton(frame: CGRect.zero)
    let btnKinentaiRiver      = UIButton(frame: CGRect.zero)
    let btnKinentaiWeather    = UIButton(frame: CGRect.zero)
    let pad21            = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let pad22            = UIView(frame: CGRect.zero)
    let pad23            = UIView(frame: CGRect.zero)
    let pad31            = UIView(frame: CGRect.zero) //ボタンの間にはさむ見えないpaddingがわり
    let pad32            = UIView(frame: CGRect.zero)
    let pad33            = UIView(frame: CGRect.zero)
    //別クラスのインスタンス保持用変数
    fileprivate var mInfoDialog: InfoDialog!
    fileprivate var mKinentaiSelectDialog: KinentaiSelectDialog!
    fileprivate var mKinentaiSelectDialog2: KinentaiSelectDialog2!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red:0.8, green:0.15, blue:0.1, alpha:1.0)
        //Button生成
        //アプリ説明書
        btnData.backgroundColor = UIColor.blue
        btnData.layer.masksToBounds = true
        btnData.setTitle("アプリ説明書", for: UIControlState())
        btnData.setTitleColor(UIColor.white, for: UIControlState())
        btnData.setTitleColor(UIColor.black, for: UIControlState.highlighted)
        btnData.layer.cornerRadius = 8.0
        btnData.tag = 0
        btnData.addTarget(self, action: #selector(self.onClickbtnData(_:)), for: .touchUpInside)
        btnData.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnData)
        //緊援隊
        btnKinentai.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentai.layer.masksToBounds = true
        btnKinentai.setTitle("緊援隊", for: UIControlState())
        btnKinentai.setTitleColor(UIColor.black, for: UIControlState())
        btnKinentai.tag=4
        btnKinentai.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(btnKinentai)
        //pad
        pad1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad1)
        pad2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad2)
        pad3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad3)
        pad4.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad4)
        //緊急消防援助隊出場基準表
        lblKinentai.text = "緊急消防援助隊出場基準表"
        lblKinentai.textColor = UIColor.yellow
        lblKinentai.textAlignment = NSTextAlignment.center
        lblKinentai.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(lblKinentai)
        //地震(震央「陸」)
        btnKinentai1.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentai1.layer.masksToBounds = true
        btnKinentai1.setTitle("地震(震央「陸」)", for: UIControlState())
        btnKinentai1.setTitleColor(UIColor.black, for: UIControlState())
        btnKinentai1.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnKinentai1.tag=5
        btnKinentai1.translatesAutoresizingMaskIntoConstraints = false
        btnKinentai1.addTarget(self, action: #selector(self.showSelectKinentai1(_:)), for: .touchUpInside)
        self.view.addSubview(btnKinentai1)
        //地震(震央「海」)
        btnKinentai2.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentai2.layer.masksToBounds = true
        btnKinentai2.setTitle("地震(震央「海域」)", for: UIControlState())
        btnKinentai2.setTitleColor(UIColor.black, for: UIControlState())
        btnKinentai2.tag=6
        btnKinentai2.translatesAutoresizingMaskIntoConstraints = false
        btnKinentai2.addTarget(self, action: #selector(self.showSelectKinentai2(_:)), for: .touchUpInside)
        self.view.addSubview(btnKinentai2)
        //アクションプラン
        btnKinentai3.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentai3.layer.masksToBounds = true
        btnKinentai3.setTitle("アクションプラン", for: UIControlState())
        btnKinentai3.setTitleColor(UIColor.black, for: UIControlState())
        btnKinentai3.tag=7
        btnKinentai3.translatesAutoresizingMaskIntoConstraints = false
        btnKinentai3.addTarget(self, action: #selector(self.showSelectKinentai3(_:)), for: .touchUpInside)
        self.view.addSubview(btnKinentai3)
        //大津波警報・噴火
        btnKinentai4.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentai4.layer.masksToBounds = true
        btnKinentai4.setTitle("大津波警報・噴火", for: UIControlState())
        btnKinentai4.setTitleColor(UIColor.black, for: UIControlState())
        btnKinentai4.tag=8
        btnKinentai4.translatesAutoresizingMaskIntoConstraints = false
        btnKinentai4.addTarget(self, action: #selector(self.showSelectKinentai4(_:)), for: .touchUpInside)
        self.view.addSubview(btnKinentai4)
        //特殊災害(NBC含む)
        btnKinentai5.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentai5.layer.masksToBounds = true
        btnKinentai5.setTitle("特殊災害(NBC含む)", for: UIControlState())
        btnKinentai5.setTitleColor(UIColor.black, for: UIControlState())
        btnKinentai5.tag=9
        btnKinentai5.translatesAutoresizingMaskIntoConstraints = false
        btnKinentai5.addTarget(self, action: #selector(self.showSelectKinentai5(_:)), for: .touchUpInside)
        self.view.addSubview(btnKinentai5)
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
        //情報（地震）
        btnKinentaiEarthquake.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentaiEarthquake.layer.masksToBounds = true
        btnKinentaiEarthquake.setTitle("情報(地震)", for: UIControlState())
        btnKinentaiEarthquake.setTitleColor(UIColor.black, for: UIControlState())
        btnKinentaiEarthquake.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnKinentaiEarthquake.tag=10
        btnKinentaiEarthquake.translatesAutoresizingMaskIntoConstraints = false
        btnKinentaiEarthquake.addTarget(self, action: #selector(self.showInfoEarthquake(_:)), for: .touchUpInside)
        self.view.addSubview(btnKinentaiEarthquake)
        //情報(停電)
        btnKinentaiBlackout.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentaiBlackout.layer.masksToBounds = true
        btnKinentaiBlackout.setTitle("情報(停電)", for: UIControlState())
        btnKinentaiBlackout.setTitleColor(UIColor.black, for: UIControlState())
        btnKinentaiBlackout.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnKinentaiBlackout.tag=11
        btnKinentaiBlackout.translatesAutoresizingMaskIntoConstraints = false
        btnKinentaiBlackout.addTarget(self, action: #selector(self.showInfoBlackout(_:)), for: .touchUpInside)
        self.view.addSubview(btnKinentaiBlackout)
        //情報(道路)
        btnKinentaiRoad.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentaiRoad.layer.masksToBounds = true
        btnKinentaiRoad.setTitle("情報(道路)", for: UIControlState())
        btnKinentaiRoad.setTitleColor(UIColor.black, for: UIControlState())
        btnKinentaiRoad.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnKinentaiRoad.tag=12
        btnKinentaiRoad.translatesAutoresizingMaskIntoConstraints = false
        btnKinentaiRoad.addTarget(self, action: #selector(self.showInfoRoad(_:)), for: .touchUpInside)
        self.view.addSubview(btnKinentaiRoad)
        //情報（関係機関）
        btnKankeikikan.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKankeikikan.layer.masksToBounds = true
        btnKankeikikan.setTitle("情報(関係機関)", for: UIControlState())
        btnKankeikikan.titleLabel!.adjustsFontSizeToFitWidth = true
        btnKankeikikan.setTitleColor(UIColor.black, for: UIControlState())
        btnKankeikikan.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnKankeikikan.tag=9
        btnKankeikikan.translatesAutoresizingMaskIntoConstraints = false
        btnKankeikikan.addTarget(self, action: #selector(self.showInfoKankeikikan(_:)), for: .touchUpInside)
        self.view.addSubview(btnKankeikikan)
        //情報(河川)
        btnKinentaiRiver.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentaiRiver.layer.masksToBounds = true
        btnKinentaiRiver.setTitle("情報(河川)", for: UIControlState())
        btnKinentaiRiver.setTitleColor(UIColor.black, for: UIControlState())
        btnKinentaiRiver.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        btnKinentaiRiver.tag=14
        btnKinentaiRiver.translatesAutoresizingMaskIntoConstraints = false
        btnKinentaiRiver.addTarget(self, action: #selector(self.showInfoRiver(_:)), for: .touchUpInside)
        self.view.addSubview(btnKinentaiRiver)
        //情報(気象)
        btnKinentaiWeather.backgroundColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)
        btnKinentaiWeather.layer.masksToBounds = true
        btnKinentaiWeather.setTitle("情報(気象)", for: UIControlState())
        btnKinentaiWeather.setTitleColor(UIColor.black, for: UIControlState())
        btnKinentaiWeather.tag=15
        btnKinentaiWeather.translatesAutoresizingMaskIntoConstraints = false
        btnKinentaiWeather.addTarget(self, action: #selector(self.showInfoWeather(_:)), for: .touchUpInside)
        self.view.addSubview(btnKinentaiWeather)
        //pad
        pad21.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad21)
        pad22.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad22)
        pad23.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad23)
        //pad
        pad31.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad31)
        pad32.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad32)
        pad33.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pad33)
        
        //ボタン押したら表示するDialog生成
        mInfoDialog = InfoDialog(parentView: self) //このViewControllerを渡してあげる
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
            //基礎データ入力ボタン
            Constraint(btnData, .top, to:self.view, .top, constant:20),
            Constraint(btnData, .leading, to:self.view, .leading, constant:8),
            Constraint(btnData, .trailing, to:self.view, .trailingMargin, constant:8)
            ])
        self.view.addConstraints([
            //pad1
            Constraint(pad1, .top, to:btnData, .bottom, constant:8),
            Constraint(pad1, .leading, to:self.view, .leading, constant:0),
            Constraint(pad1, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //緊援隊ボタン
            Constraint(btnKinentai, .top, to:btnData, .bottom, constant:8),
            Constraint(btnKinentai, .leading, to:self.view, .leading, constant:8),
            Constraint(btnKinentai, .trailing, to:self.view, .trailingMargin, constant:8)
            ])
        self.view.addConstraints([
            //padY1
            Constraint(padY1, .top, to:btnKinentai, .bottom, constant:0),
            Constraint(padY1, .leading, to:self.view, .leading, constant:0),
            Constraint(padY1, .height, to:self.view, .height, constant:0, multiplier:0.05)
            ])
        self.view.addConstraints([
            //緊急消防援助隊出場基準表ラベル
            Constraint(lblKinentai, .bottom, to:padY2, .top, constant:8),
            Constraint(lblKinentai, .centerX, to:self.view, .centerX, constant:8),
            Constraint(lblKinentai, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY2
            Constraint(padY2, .bottom, to:btnKinentai1, .top, constant:0),
            Constraint(padY2, .leading, to:self.view, .leading, constant:0),
            Constraint(padY2, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //地震(震央「陸」)
            Constraint(btnKinentai1, .bottom, to:padY3, .top, constant:0),
            Constraint(btnKinentai1, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnKinentai1, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY3
            Constraint(padY3, .bottom, to:btnKinentai2, .top, constant:0),
            Constraint(padY3, .leading, to:self.view, .leading, constant:0),
            Constraint(padY3, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //地震(震央「海」)
            Constraint(btnKinentai2, .bottom, to:padY4, .top, constant:0),
            Constraint(btnKinentai2, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnKinentai2, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY4
            Constraint(padY4, .bottom, to:btnKinentai3, .top, constant:0),
            Constraint(padY4, .leading, to:self.view, .leading, constant:0),
            Constraint(padY4, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //アクションプラン
            Constraint(btnKinentai3, .centerY, to:self.view, .centerY, constant:0),
            Constraint(btnKinentai3, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnKinentai3, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY5
            Constraint(padY5, .top, to:btnKinentai3, .bottom, constant:0),
            Constraint(padY5, .leading, to:self.view, .leading, constant:0),
            Constraint(padY5, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //大津波警報・噴火
            Constraint(btnKinentai4, .top, to:padY5, .bottom, constant:0),
            Constraint(btnKinentai4, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnKinentai4, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //padY6
            Constraint(padY6, .top, to:btnKinentai4, .bottom, constant:0),
            Constraint(padY6, .leading, to:self.view, .leading, constant:0),
            Constraint(padY6, .height, to:self.view, .height, constant:0, multiplier:0.03)
            ])
        self.view.addConstraints([
            //特殊災害(NBC含む)
            Constraint(btnKinentai5, .top, to:padY6, .bottom, constant:0),
            Constraint(btnKinentai5, .centerX, to:self.view, .centerX, constant:8),
            Constraint(btnKinentai5, .width, to:self.view, .width, constant:0, multiplier:0.8)
            ])
        self.view.addConstraints([
            //pad21
            Constraint(pad21, .bottom, to:btnKankeikikan, .top, constant:-8),
            Constraint(pad21, .leading, to:self.view, .leading, constant:0),
            Constraint(pad21, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //情報(地震)ボタン
            Constraint(btnKinentaiEarthquake, .bottom, to:btnKankeikikan, .top, constant:-8),
            Constraint(btnKinentaiEarthquake, .leading, to:pad21, .trailing, constant:0),
            Constraint(btnKinentaiEarthquake, .width, to:self.view, .width, constant:0, multiplier:0.3)
            ])
        self.view.addConstraints([
            //pad22
            Constraint(pad22, .bottom, to:btnKankeikikan, .top, constant:-8),
            Constraint(pad22, .leading, to:btnKinentaiEarthquake, .trailing, constant:0),
            Constraint(pad22, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //情報(停電)ボタン
            Constraint(btnKinentaiBlackout, .bottom, to:btnKankeikikan, .top, constant:-8),
            Constraint(btnKinentaiBlackout, .leading, to:pad22, .trailing, constant:0),
            Constraint(btnKinentaiBlackout, .width, to:btnKinentaiEarthquake, .width, constant:0)
            ])
        self.view.addConstraints([
            //pad23
            Constraint(pad23, .bottom, to:btnKankeikikan, .top, constant:-8),
            Constraint(pad23, .leading, to:btnKinentaiBlackout, .trailing, constant:0),
            Constraint(pad23, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //情報(道路)ボタン
            Constraint(btnKinentaiRoad, .bottom, to:btnKankeikikan, .top ,constant:-8),
            Constraint(btnKinentaiRoad, .leading, to:pad23, .trailing, constant:0),
            Constraint(btnKinentaiRoad, .width, to:btnKinentaiEarthquake, .width, constant:0)
            ])
        self.view.addConstraints([
            //pad31
            Constraint(pad31, .top, to:btnKinentaiEarthquake, .bottom, constant:8),
            Constraint(pad31, .leading, to:self.view, .leading, constant:0),
            Constraint(pad31, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //情報(関係機関)
            Constraint(btnKankeikikan, .bottom, to:self.view, .bottom, constant:-8),
            Constraint(btnKankeikikan, .leading, to:pad31, .trailing, constant:0),
            Constraint(btnKankeikikan, .width, to:self.view, .width, constant:0, multiplier:0.3)
            ])
        self.view.addConstraints([
            //pad32
            Constraint(pad32, .bottom, to:self.view, .bottom, constant:-8),
            Constraint(pad32, .leading, to:btnKankeikikan, .trailing, constant:0),
            Constraint(pad32, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //情報(河川)
            Constraint(btnKinentaiRiver, .bottom, to:self.view, .bottom, constant:-8),
            Constraint(btnKinentaiRiver, .leading, to:pad32, .trailing, constant:0),
            Constraint(btnKinentaiRiver, .width, to:btnKankeikikan, .width, constant:0)
            ])
        self.view.addConstraints([
            //pad33
            Constraint(pad33, .bottom, to:self.view, .bottom, constant:-8),
            Constraint(pad33, .leading, to:btnKinentaiRiver, .trailing, constant:0),
            Constraint(pad33, .width, to:self.view, .width, constant:0, multiplier:0.024)
            ])
        self.view.addConstraints([
            //情報(気象)
            Constraint(btnKinentaiWeather, .bottom, to:self.view, .bottom ,constant:-8),
            Constraint(btnKinentaiWeather, .leading, to:pad33, .trailing, constant:0),
            Constraint(btnKinentaiWeather, .width, to:btnKankeikikan, .width, constant:0)
            ])
    }

    //地震(震央「陸」)
    func showSelectKinentai1(_ sender: UIButton){
        mKinentaiSelectDialog = KinentaiSelectDialog(index: 1, parentView: self)
        mKinentaiSelectDialog.showInfo()
    }
    
    //地震(震央「海域」)
    func showSelectKinentai2(_ sender: UIButton){
        mKinentaiSelectDialog = KinentaiSelectDialog(index: 2, parentView: self)
        mKinentaiSelectDialog.showInfo()
    }
    
    //アクションプラン
    func showSelectKinentai3(_ sender: UIButton){
        mKinentaiSelectDialog = KinentaiSelectDialog(index: 3, parentView: self)
        mKinentaiSelectDialog.showInfo()
    }
    
    //大津波警報・噴火
    func showSelectKinentai4(_ sender: UIButton){
        mKinentaiSelectDialog = KinentaiSelectDialog(index: 4, parentView: self)
        mKinentaiSelectDialog.showInfo()
    }
    
    //特殊災害(NBC含む)
    func showSelectKinentai5(_ sender: UIButton){
        //特殊災害はKinentaiSelectDialogをすっとばしていきなり都道府県選択のKinentaiSelectDIalog2を呼び出す
        mKinentaiSelectDialog2 = KinentaiSelectDialog2(index: 51, parentView: self)
        mKinentaiSelectDialog2.showInfo()
    }
    
    //情報(地震)
    func showInfoEarthquake(_ sender: UIButton){
        mInfoDialog.showInfo("earthquake")
    }
    
    //情報（道路）
    func showInfoRoad(_ sender: UIButton){
        mInfoDialog.showInfo("road")
    }
    
    //情報(関係機関)
    func showInfoKankeikikan(_ sender: UIButton){
        mInfoDialog.showInfo("kankeikikan")
    }
    
    //情報（停電）
    func showInfoBlackout(_ sender: UIButton){
        mInfoDialog.showInfo("blackout")
    }
    
    //情報(河川)
    func showInfoRiver(_ sender: UIButton){
        mInfoDialog.showInfo("river")
    }
    
    //情報(気象)
    func showInfoWeather(_ sender: UIButton){
        mInfoDialog.showInfo("weather")
    }
    
    //アプリ説明書画面遷移
    func onClickbtnData(_ sender : UIButton){
        //dataViewControllerのインスタンス生成
        let data:GuideViewController = GuideViewController()
        
        //navigationControllerのrootViewControllerにdataViewControllerをセット
        let nav = UINavigationController(rootViewController: data)
        nav.setNavigationBarHidden(true, animated: false) //これをいれないとNavigationBarが表示されてうざい
        
        //画面遷移
        self.present(nav, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

