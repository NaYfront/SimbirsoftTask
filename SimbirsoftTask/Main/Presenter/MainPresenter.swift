//
//  MainPresenter.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 30.06.2022.
//

import Foundation
import UIKit

protocol MainViewProtocol: AnyObject {

}

protocol MainViewPresenterProtocol: AnyObject {
    var date: Date? { get set }
    var tableContent: [Task]? { get set }
    init(view: MainViewProtocol)
}

class MainPresenter: MainViewPresenterProtocol {
    // MARK: - Properties
    weak var view: MainViewProtocol?
    var date: Date?
    var tableContent: [Task]?
    
    // MARK: - Init
    required init(view: MainViewProtocol) {
        self.view = view
        self.date = Date()
    }
}
