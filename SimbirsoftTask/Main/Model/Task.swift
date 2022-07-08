//
//  Task.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 01.07.2022.
//

import Foundation
import RealmSwift

class Task: Object {
    @objc dynamic var name: String!
    @objc dynamic var specification: String?
    @objc dynamic var timeStart: Date!
    @objc dynamic var timeFinish: Date!
    
    func getTaskRange() -> ClosedRange<Int> {
        let startHour = Calendar.current.component(.hour, from: self.timeStart)
        let endHour = Calendar.current.component(.hour, from: self.timeFinish)
        
        return startHour...endHour
    }
}
