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
    init(view: MainViewProtocol)
}

class MainPresenter: MainViewPresenterProtocol {
    // MARK: - Properties
    weak var view: MainViewProtocol?
    var date: Date?
    
    // MARK: - Init
    required init(view: MainViewProtocol) {
        self.view = view
        self.date = Date()
    }
}
