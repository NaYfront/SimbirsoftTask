//
//  Builder.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 30.06.2022.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    func createMainModule(router: RouterProtocol, dataManager: DataManagerProtocol) -> UIViewController
    func createDetailModule(router: RouterProtocol, task: Task) -> UIViewController
    func createCreateTaskModule(router: RouterProtocol, dataManager: DataManagerProtocol) -> UIViewController
}

class Builder: BuilderProtocol {
    func createMainModule(router: RouterProtocol, dataManager: DataManagerProtocol) -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view, router: router, dataManager: dataManager)
        
        view.presenter = presenter
        
        return view
    }
    
    func createDetailModule(router: RouterProtocol, task: Task) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, task: task)
        
        view.presenter = presenter
        
        return view
    }
    
    func createCreateTaskModule(router: RouterProtocol, dataManager: DataManagerProtocol) -> UIViewController {
        let view = CreateTaskViewController()
        let presenter = CreateTaskPresenter(view: view, router: router, dataManager: dataManager)
        
        view.presenter = presenter
        
        return view
    }
}
