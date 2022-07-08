//
//  Router.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 30.06.2022.
//

import Foundation
import UIKit

protocol RouterMainProtocol: AnyObject {
    var navigationController: UINavigationController? { get set }
    var builder: BuilderProtocol? { get set }
    var dataManager: DataManagerProtocol? { get set }
}

protocol RouterProtocol: RouterMainProtocol {
    func showMain()
    func showDetail(task: Task)
    func showCreateTask()
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var builder: BuilderProtocol?
    var dataManager: DataManagerProtocol?
    
    init(navigationController: UINavigationController, builder: BuilderProtocol, dataManager: DataManagerProtocol) {
        self.navigationController = navigationController
        self.builder = builder
        self.dataManager = dataManager
    }
    
    func showMain() {
        if let navigationController = navigationController {
            guard let dataManager = dataManager, let mainVC = builder?.createMainModule(router: self, dataManager: dataManager) else { return }
            navigationController.viewControllers = [mainVC]
        }
    }
    
    func showDetail(task: Task) {
        if let navigationController = navigationController {
            guard let detailVC = builder?.createDetailModule(router: self, task: task) else { return }
            navigationController.pushViewController(detailVC, animated: true)
        }
    }
    
    func showCreateTask() {
        if let navigationController = navigationController {
            guard let dataManager = dataManager, let createTaskVC = builder?.createCreateTaskModule(router: self, dataManager: dataManager) else { return }
            navigationController.pushViewController(createTaskVC, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
