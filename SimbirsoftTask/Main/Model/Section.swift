//
//  Section.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 04.07.2022.
//

import Foundation

struct Section {
    var time = ""
    var tasks: [Task]?
    
    init(index: Int, tasks: [Task]?) {
        self.time = getTime(index: index)
        self.tasks = tasks
    }
    
    private func getTime(index: Int) -> String {
        if index < 9 {
            return "0\(index):00 - 0\(index + 1):00"
        } else if index == 9 {
            return "09:00 - 10:00"
        } else {
            return "\(index):00 - \(index + 1):00"
        }
    }
}
