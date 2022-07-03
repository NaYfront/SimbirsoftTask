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
}

protocol RouterProtocol: RouterMainProtocol {
    func showMain()
    func showDetail(task: Task)
    func showCreateTask()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var builder: BuilderProtocol?
    
    init(navigationController: UINavigationController, builder: BuilderProtocol) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func showMain() {
        if let navigationController = navigationController {
            guard let mainVC = builder?.createMainModule(router: self) else { return }
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
            guard let createTaskVC = builder?.createCreateTaskModule(router: self) else { return }
            navigationController.pushViewController(createTaskVC, animated: true)
        }
    }
}
