//
//  Shift.swift
//  shiftEducation1.1
//
//  Created by 中尾涼 on 2017/09/18.
//  Copyright © 2017年 中尾涼. All rights reserved.
//

import Foundation
import RealmSwift

class Shift: Object{
    dynamic var id = Int()
    dynamic var title = String()
    dynamic var startDate = Date()
    dynamic var endDate = Date()
    dynamic var breakDate = Date()
    dynamic var salary = Int()
    
    convenience required init(title: String, startDate: Date, endDate: Date, breakTime: Date, salary: Int) {
        self.init()
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.breakDate = breakTime
        self.salary = salary
    }
    
    func insert(){
        let realm = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        id = realm.objects(Shift.self).count
        try! realm.write {
            realm.add(self)
        }
    }
}
