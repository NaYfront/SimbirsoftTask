//
//  CreateTaskPresenter.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 03.07.2022.
//

import Foundation
import UIKit

protocol CreateTaskViewProtocol: AnyObject {
    func configure()
}

protocol CreateTaskViewPresenterProtocol: AnyObject {
    var task: Task { get set }
    init(view: CreateTaskViewProtocol, task: Task)
}

class CreateTaskPresenter: CreateTaskViewPresenterProtocol {
    // MARK: - Properties
    weak var view: CreateTaskViewProtocol?
    var task: Task
    
    // MARK: - Init
    required init(view: CreateTaskViewProtocol, task: Task) {
        self.view = view
        self.task = task
    }
}
