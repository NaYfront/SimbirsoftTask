//
//  CreateTaskPresenter.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 03.07.2022.
//

import Foundation
import UIKit

protocol CreateTaskViewProtocol: AnyObject {
    func showAlert(title: String?, message: String?)
}

protocol CreateTaskViewPresenterProtocol: AnyObject {
    init(view: CreateTaskViewProtocol, router: RouterProtocol, dataManager: DataManagerProtocol)
    func validate(name: String?, timeStart: Date, timeEnd: Date)
}

class CreateTaskPresenter: CreateTaskViewPresenterProtocol {
    // MARK: - Properties
    weak var view: CreateTaskViewProtocol?
    var router: RouterProtocol?
    var dataManager: DataManagerProtocol?
    
    // MARK: - Init
    required init(view: CreateTaskViewProtocol, router: RouterProtocol, dataManager: DataManagerProtocol) {
        self.view = view
        self.router = router
        self.dataManager = dataManager
    }
    
    func validate(name: String?, timeStart: Date, timeEnd: Date) {
        if name == nil {
            view?.showAlert(title: "No name", message: "Please fill in the name field")
        } else if timeStart <= timeEnd {
            view?.showAlert(title: "Wrong time selected", message: "Please make sure the start time is less than the end time")
        } else {
            
        }
    }
}
