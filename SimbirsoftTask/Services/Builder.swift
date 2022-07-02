//
//  Builder.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 30.06.2022.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    static func createMainModule() -> UIViewController
}

class Builder {
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view)
        
        view.presenter = presenter
        
        return view
    }
}
