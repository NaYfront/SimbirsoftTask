//
//  DetailPresenter.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 03.07.2022.
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
    func configure()
}

protocol DetailViewPresenterProtocol: AnyObject {
    var task: Task { get set }
    init(view: DetailViewProtocol, task: Task)
    
    func convertDate() -> String
}

class DetailPresenter: DetailViewPresenterProtocol {
    // MARK: - Properties
    weak var view: DetailViewProtocol?
    var task: Task
    
    // MARK: - Init
    required init(view: DetailViewProtocol, task: Task) {
        self.view = view
        self.task = task
    }
    
    func convertDate() -> String {
        return "\(Date.correctFormat(date: task.timeStart)) - \(Date.correctFormat(date: task.timeEnd))"
    }
}
