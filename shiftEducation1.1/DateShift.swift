//
//  DateShift.swift
//  shiftEducation1.1
//
//  Created by 中尾涼 on 2017/09/19.
//  Copyright © 2017年 中尾涼. All rights reserved.
//

import Foundation
import RealmSwift

class DateShift: Object{
    dynamic var id = Int()
    dynamic var StartDate = Date()
    var shiftIDs = List<Shift>()
    
    convenience required init(startDate: Date, shiftIDs: List<Shift>) {
        self.init()
        self.StartDate = startDate
        self.shiftIDs = shiftIDs
    }
    
    func insert(){
        let realm = try! Realm()
        // realmファイルのURLをデバッグ出力
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        id = realm.objects(Shift.self).count
        try! realm.write {
            realm.add(self)
        }
    }
    /*
     使い方
     let shift = Shift(title: "hey", startDate: Date(), endDate: Date(), breakTime: Date(), salary: 1000)
     shift.insert()
     */
}
