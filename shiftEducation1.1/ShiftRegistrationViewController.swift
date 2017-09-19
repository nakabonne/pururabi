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
        let shift = Shift(title: "hey", startDate: Date(), endDate: Date(), breakTime: Date(), salary: 1000)
        shift.insert()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
