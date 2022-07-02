//
//  MainViewController.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 30.06.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var calendarDatePicker: UIDatePicker!
    
    var tableView: UITableView!
    var presenter: MainViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension MainViewController: MainViewProtocol {
    
}
