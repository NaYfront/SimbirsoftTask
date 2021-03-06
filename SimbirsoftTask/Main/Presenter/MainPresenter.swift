//
//  MainPresenter.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 30.06.2022.
//

import Foundation
import UIKit

protocol MainViewProtocol: AnyObject {
    func reloadData()
}

protocol MainViewPresenterProtocol: AnyObject {
    var date: Date? { get set }
    var tasksTable: TasksTable? { get set }
    init(view: MainViewProtocol, router: RouterProtocol, dataManager: DataManagerProtocol)
    func tapOnTask(task: Task)
    func tapOnPlusButton()
    func uniteTasks(date: Date?)
    func dateChanged(date: Date)
}

class MainPresenter: MainViewPresenterProtocol {
    // MARK: - Properties
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    var dataManager: DataManagerProtocol?
    var date: Date?
    var tasksTable: TasksTable?
    
    // MARK: - Init
    required init(view: MainViewProtocol, router: RouterProtocol, dataManager: DataManagerProtocol) {
        self.view = view
        self.router = router
        self.dataManager = dataManager
        self.date = Date()
    }
    
    func tapOnTask(task: Task) {
        router?.showDetail(task: task)
    }
    
    func tapOnPlusButton() {
        router?.showCreateTask()
    }
    
    func uniteTasks(date: Date?) {
        guard let date = date else { return }
        
        guard let tasks = dataManager?.uniteTasks(date: date) else { return }
        self.tasksTable = TasksTable(tasks: tasks)
        
        self.view?.reloadData()
    }
    
    func dateChanged(date: Date) {
        if self.date != date {
            self.date = date
            uniteTasks(date: date)
        }
    }
}
