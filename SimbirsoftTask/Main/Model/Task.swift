//
//  Task.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 01.07.2022.
//

import Foundation

struct Task {
    let name: String
    let description: String?
    let timeStart: Date
    let timeFinish: Date
    
    func getTaskRange() -> ClosedRange<Int> {
        let startHour = Calendar.current.component(.hour, from: self.timeStart)
        let endHour = Calendar.current.component(.hour, from: self.timeFinish)
        
        return startHour...endHour
    }
}
