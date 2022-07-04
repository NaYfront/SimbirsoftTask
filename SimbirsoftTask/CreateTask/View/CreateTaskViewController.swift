//
//  CreateTaskViewController.swift
//  SimbirsoftTask
//
//  Created by NaYfront on 03.07.2022.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    var presenter: CreateTaskViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func createTaskAction(_ sender: Any) {
    }
}

extension CreateTaskViewController: CreateTaskViewProtocol {
    
}
