//
//  TasksTable.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 04.07.2022.
//

import Foundation

struct TasksTable {
    var sections: [Section]
    
    init(tasks: [Task]) {
        var sectionTasks = [Int: [Task]]()
        var sections = [Section]()

        for task in tasks {
            let range = task.getTaskRange()
            for index in range {
                if sectionTasks[index] != nil {
                    sectionTasks[index]?.append(task)
                } else {
                    sectionTasks[index] = [task]
                }
            }
        }

        for index in 0...23 {
            sections.append(Section(index: index, tasks: sectionTasks[index]))
        }

        self.sections = sections
    }
}
