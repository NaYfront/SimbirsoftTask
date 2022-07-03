//
//  CreateTaskPresenter.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 03.07.2022.
//

import Foundation
import UIKit

protocol CreateTaskViewProtocol: AnyObject {
    
}

protocol CreateTaskViewPresenterProtocol: AnyObject {
    init(view: CreateTaskViewProtocol)
}

class CreateTaskPresenter: CreateTaskViewPresenterProtocol {
    // MARK: - Properties
    weak var view: CreateTaskViewProtocol?
    
    // MARK: - Init
    required init(view: CreateTaskViewProtocol) {
        self.view = view
    }
}
