//
//  RouterTests.swift
//  SimbirsoftTaskTests
//
//  Created by NaYfront on 10.07.2022.
//

import XCTest
@testable import SimbirsoftTask

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

class RouterTests: XCTestCase {

    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let builder = Builder()
    let dataManager = DataManager()
    
    override func setUpWithError() throws {
        router = Router(navigationController: navigationController, builder: builder, dataManager: dataManager)
    }

    override func tearDownWithError() throws {
        router = nil
    }
    
    func testShowViewControllers() {
        let task = Task()
        task.name = "So something"
        task.specification = "Something interesting"
        task.timeStart = Date()
        task.timeEnd = Date()
        
        router.showDetail(task: task)
        let detailVC = navigationController.presentedVC

        XCTAssertTrue(detailVC is DetailViewController)
        
        router.showCreateTask()
        let createTaskVC = navigationController.presentedVC
        
        XCTAssertTrue(createTaskVC is CreateTaskViewController)
    }
}
