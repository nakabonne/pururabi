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
    var shifts = List<Shift>()
    
    convenience required init(startDate: Date, shifts: List<Shift>) {
        self.init()
        self.StartDate = startDate
        self.shifts = shifts
    }
    
    /*override static func primaryKey() -> String? {
        return "id"
    }*/
    
    func insert(){
        let realm = try! Realm()
        // realmファイルのURLをデバッグ出力
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        id = realm.objects(Shift.self).count
        try! realm.write {
            realm.add(self)
        }
    }
    
    static func findByDate(startDate: Date) -> DateShift?{
        let realm = try! Realm()
        let predicate = NSPredicate(format: "StartDate = %@", startDate as CVarArg)
        return realm.objects(DateShift.self).filter(predicate).first
    }
    /*
     使い方
     let shift = DateShift(startDate: Date(), shifts: List())
     shift.insert()
     */
}
