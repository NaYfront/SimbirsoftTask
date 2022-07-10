//
//  DataManager.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 04.07.2022.
//

import Foundation
import RealmSwift

protocol DataManagerProtocol: AnyObject {
    func save(task: Task)
    func uniteTasks(date: Date) -> [Task]?
}

class DataManager: DataManagerProtocol {
    lazy var realm = try? Realm()

    func save(task: Task) {
        guard let realm = realm else { return }
        do {
            try realm.write {
                realm.add(task)
            }
        } catch let error {
            print(error)
        }
    }

    func uniteTasks(date: Date) -> [Task]? {
        guard let realm = realm else { return nil }
        
        let objects = realm.objects(Task.self)
        return Array(objects).filter { filter(date: date, object: $0) }
    }
    
    private func filter(date: Date, object: Task) -> Bool {
        return date.getDayComponents() >= object.timeStart.getDayComponents() && date.getDayComponents() <= object.timeEnd.getDayComponents()
    }
}
