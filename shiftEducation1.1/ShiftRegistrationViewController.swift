//
//  ShiftRegistrationViewController.swift
//  shiftEducation1.1
//
//  Created by 中尾涼 on 2017/09/18.
//  Copyright © 2017年 中尾涼. All rights reserved.
//

import UIKit

class ShiftRegistrationViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        // 保存テスト------------------------
        let t = "へい"
        let shift = Shift(title: t, startTime: Date(), endTime: Date(), breakTime: Date(), salary: 3000)
        
        shift.insert()
        if let s = shift.find(key: t){
            let st = s.title ?? " "
            print(st)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
