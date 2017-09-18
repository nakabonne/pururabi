//
//  Shift.swift
//  shiftEducation1.1
//
//  Created by 中尾涼 on 2017/09/18.
//  Copyright © 2017年 中尾涼. All rights reserved.
//

import Foundation

class Shift: NSObject, NSCoding{
    var title: String?
    var startTime: Date?
    var endTime: Date?
    var breakTime: Date?
    var salary: Int?
    
    let userDefaults = UserDefaults.standard
    
    init(title: String?, startTime: Date?, endTime: Date?, breakTime: Date?, salary: Int?) {
        self.title = title
        self.startTime = startTime
        self.endTime = endTime
        self.breakTime = breakTime
        self.salary = salary
    }
    
    required init?(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObject(forKey: "title") as? String
        startTime = aDecoder.decodeObject(forKey: "startTime") as? Date
        endTime = aDecoder.decodeObject(forKey: "endTime") as? Date
        breakTime = aDecoder.decodeObject(forKey: "breakTime") as? Date
        salary = aDecoder.decodeObject(forKey: "salary") as? Int
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(startTime, forKey: "startTime")
        aCoder.encode(endTime, forKey: "endTime")
        aCoder.encode(breakTime, forKey: "breakTime")
        aCoder.encode(salary, forKey: "salary")
    }
    
    func insert(){
        let archiveData = NSKeyedArchiver.archivedData(withRootObject: self)
        if let t = title{
            userDefaults.set(archiveData, forKey: "shift_" + t)
        }
    }
    
    func find(key: String) -> Shift?{
        let storedData = userDefaults.object(forKey: key) as? Data
        if let data = storedData {
            let unarchivedData = NSKeyedUnarchiver.unarchiveObject(with: data) as? Shift
            return unarchivedData
        }
        return nil
    }
}
